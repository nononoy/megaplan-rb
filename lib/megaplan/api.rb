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

    def get_headers(path)
      attrs = authenticate
      secret_key = attrs['SecretKey']
      date = Time.now.rfc2822
      { "Date"=> date,
        "Accept"=> "application/json",
        "Content-Type" => "application/json",
        "X-Authorization" => "#{attrs['AccessId']}:#{create_signature(secret_key, date, path)}"
      }
    end

    def create_signature(key, date, path)
      require 'cgi'
      require 'openssl'

      data = "GET\n\napplication/json\n#{date}\n#{path}"
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
          bad_response(response, parsed_body(response), headers)
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
        path = resource_path(client, 'list.api', nil, query)
        headers = client.get_headers(path.gsub('https://', ''))
        response = HTTParty.get(path, :headers => headers)
        check_response(response)
      end

      def custom_get(client, custom_path,  query = {})
        path = resource_path(client, 'list.api', custom_path, query)
        headers = client.get_headers(path.gsub('https://', ''))
        response = HTTParty.get(path, :headers => headers)
        check_response(response)
      end

      def save(client, query = {})
        path = resource_path(client, 'save.api', nil, query)
        headers = client.get_headers(path.gsub('https://', ''))
        response = HTTParty.get(path, :headers => headers)
        check_response(response)
      end

      def delete(client, query = {})
        path = resource_path(client, 'delete.api', nil, query)
        headers = client.get_headers(path.gsub('https://', ''))
        response = HTTParty.get(path, :headers => headers)
        check_response(response)
      end

      def resource_path(client, action_path, custom_path, query = {})
        if custom_path
          url = "https://#{client.initial_path}" << custom_path
        else
          class_name = name.split('::').inject(Object) do |mod, class_name|
            mod.const_get(class_name)
          end
          class_endpoint = class_name.class_endpoint
          url = "https://#{client.initial_path}" << class_endpoint << action_path
        end
        query_path(url, query)
      end

      def bad_response(response, parsed_body, params={})
        puts params.inspect
        puts parsed_body

        if response.class == HTTParty::Response
          raise HTTParty::ResponseError, response
        end
        raise StandardError, (parsed_body['status']['message'] rescue 'unknown error')
      end
    end

  end

end
