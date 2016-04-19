module Megaplan

  class Tag < Api

    class << self

      def class_endpoint
        "/BumsCommonApiV01/Tags/"
      end

      def assign(client, query = {})
        custom_post(client, class_endpoint + "assign.api", query)
      end

      def search(client, query = {})
        custom_post(client, class_endpoint + "search.api", query)
      end

    end
  end

end
