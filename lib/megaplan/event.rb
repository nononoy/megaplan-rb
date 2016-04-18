module Megaplan

  class Event < Api

    class << self

      def class_endpoint
        "/BumsTimeApiV01/Event/"
      end

      def create(client, query = {})
        path = resource_path(client, 'create.api', nil, query)
        headers = client.get_headers(path.gsub('https://', ''))
        response = HTTParty.get(path, :headers => headers)
        check_response(response)
      end

      def categories(client, query = {})
        custom_get(client, "/BumsTimeApiV01/Event/categories.api", query)['categories']
      end
    end
  end

end
