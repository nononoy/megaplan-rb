module Megaplan

  class Favorite < Api

    class << self

      def class_endpoint
        "/BumsCommonApiV01/Favorite/"
      end

      def add(client, query = {})
        custom_post(client, class_endpoint + "add.api", query)
      end

      def remove(client, query = {})
        custom_post(client, class_endpoint + "remove.api", query)
      end

    end
  end

end
