module Megaplan

  class Search < Api

    class << self

      def class_endpoint
        "/BumsCommonApiV01/Search/"
      end

      def new(client, query = {})
        path = resource_path(client, 'quick.api', query)
        headers = client.get_headers(path.gsub('https://', ''))
        response = HTTParty.get(path, :headers => headers)
        check_response(response)
      end

    end
  end

end
