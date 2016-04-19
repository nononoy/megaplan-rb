module Megaplan

  class History < Api

    class << self

      def class_endpoint
        "/BumsCommonApiV01/History/"
      end

      def all(client, query = {})
        custom_get(client, class_endpoint + "all.api", query)['changes'] rescue []
      end

    end
  end

end
