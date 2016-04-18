module Megaplan

  class Search < Api

    class << self

      def class_endpoint
        "/BumsCommonApiV01/Search/"
      end

      def new(client, query = {})
        path = resource_path(:get, client, 'quick.api', nil, query)
        headers = client.get_headers(:get, path.gsub('https://', ''))
        response = HTTParty.get(path, :headers => headers)
        check_response(response)
      end

    end
  end

end
