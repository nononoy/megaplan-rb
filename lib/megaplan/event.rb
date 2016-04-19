module Megaplan

  class Event < Api

    class << self

      def class_endpoint
        "/BumsTimeApiV01/Event/"
      end

      def categories(client, query = {})
        custom_get(client, class_endpoint + "categories.api", query)['categories'] rescue []
      end

      def update(client, query = {})
        custom_post(client, class_endpoint + "update.api", query)
      end

      def finish(client, query = {})
        custom_post(client, class_endpoint + "finish.api", query)
      end

      def places(client)
        custom_get(client, class_endpoint + "places.api")["places"] rescue []
      end


    end
  end

end
