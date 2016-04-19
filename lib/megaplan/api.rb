module Megaplan
  require 'forwardable'

  class Api

    extend Forwardable
    def_delegators 'self.class', :resource_path, :bad_response, :parsed_body

    attr_reader :endpoint, :login, :password

    def initialize(attrs = {})
      @endpoint = attrs[:endpoint]
      @login    = attrs[:login]
      @password = attrs[:password]
    end

    def authenticate
      response = HTTParty.get(auth_path, :query => auth_params)
      if response.success?
        parsed_body(response)
      else
        bad_response(response, parsed_body(response), auth_params)
      end
    end

    def auth_params
      require 'digest/md5'
      { Login: login, Password: Digest::MD5.hexdigest(password) }
    end

    def auth_path
      "https://" + initial_path + "/BumsCommonApiV01/User/authorize.api"
    end

    def initial_path
      "#{endpoint}.megaplan.ru"
    end

    def get_headers(type, path)
      attrs = authenticate
      secret_key = attrs['SecretKey']
      date = Time.now.rfc2822
      { "Date"=> date,
        "Accept"=> "application/json",
        "Content-Type" => "application/json",
        "X-Authorization" => "#{attrs['AccessId']}:#{create_signature(type, secret_key, date, path)}"
      }
    end

    def create_signature(type, key, date, path)
      require 'cgi'
      require 'openssl'

      data = "#{type == :get ? "GET" : "POST"}\n\napplication/json\n#{date}\n#{path}"
      Base64.strict_encode64(OpenSSL::HMAC.hexdigest('sha1', key, data))
    end

    class << self

      def parsed_body(res)
        body = JSON.parse(res.body) rescue {}
        if body["status"]["code"] != "error"
          body["data"]
        else
          body
        end
      end

      def to_query(params)
        params.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join("&")
      end

      def query_path(path, query)
        path + (query.any? ? "?#{to_query(query)}" : "")
      end

      def check_response(response)
        if response.success?
          parsed_body(response)
        else
          bad_response(response, parsed_body(response))
        end
      end

      def find(client, query)
        output = []
        @arr.each do |item|
          success = if query.keys.all? { |x| item.keys.include? x }
                      if query.all? { |k,v| !v.respond_to?(:keys)}
                        query.keys.all? { |i| query[i] == item[i]} ? true : false
                      else
                        result = []
                        query.keys.each do |each|
                          result << if query[each].respond_to?(:keys)
                                      if query[each].keys.all? { |x| item[each].keys.include? x }
                                         query[each].keys.all?{ |i| query[each][i] == item[each][i] } ? true : false
                                      end
                                    else
                                      true if query[each] == item[each]
                                    end
                        end
                        result.uniq == [true] ? true : false
                      end
                    else
                      false
                    end
          output << item if success
        end
        output
      end

      def list(client, query = {})
        make_get_req('list.api', client, query, nil)
      end

      def card(client, query = {})
        make_get_req('card.api', client, query, nil)
      end


      def create(client, query = {})
        make_post_req('create.api', client, query, nil)
      end

      def save(client, query = {})
        make_post_req('save.api', client, query, nil)
      end

      def edit(client, query = {})
        make_post_req('edit.api', client, query, nil)
      end

      def delete(client, query = {})
        make_post_req('delete.api', client, query, nil)
      end

      def custom_get(client, custom_path, query = {})
        make_get_req(nil, client, query, custom_path)
      end

      def custom_post(client, custom_path, query = {})
        make_post_req(nil, client, query, custom_path)
      end

      def make_post_req(action, client, query, custom_path)
        path = resource_path(:post, client, action, custom_path, query)
        headers = client.get_headers(:post, path.gsub('https://', ''))
        response = HTTParty.post(path, body: query.to_json, headers: headers)
        check_response(response)
      end

      def make_get_req(action, client, query, custom_path)
        path = resource_path(:get, client, action, custom_path, query)
        headers = client.get_headers(:get, path.gsub('https://', ''))
        response = HTTParty.get(path, headers: headers)
        check_response(response)
      end

      def resource_path(type, client, action_path, custom_path, query = {})
        if custom_path
          url = "https://#{client.initial_path}" << custom_path
        else
          class_name = name.split('::').inject(Object) do |mod, class_name|
            mod.const_get(class_name)
          end
          class_endpoint = class_name.class_endpoint rescue "/"
          url = "https://#{client.initial_path}" << class_endpoint << action_path
        end
        query_path(url, query)
      end

      def bad_response(response, parsed_body)
        puts parsed_body

        if response.class == HTTParty::Response
          raise HTTParty::ResponseError, response
        end
        raise StandardError, (parsed_body['status']['message'] rescue 'unknown error')
      end
    end

  end

end
