module Megaplan

  class History < Api

    class << self

      def class_endpoint
        "/BumsCommonApiV01/History/"
      end

      def all(client, query = {})
        custom_get(client, "/BumsCommonApiV01/History/all.api", query)['changes']
      end

    end
  end

end
