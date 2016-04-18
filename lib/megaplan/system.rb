module Megaplan

  class System < Api

    class << self
      def datetime(client)
        custom_get(client, "/BumsCommonApiV01/System/datetime.api")["datetime"]
      end

      def feedback(client, query)
        custom_post(client, "/BumsCommonApiV01/System/feedback.api", query)
      end

      def currencies(client, query = {})
        custom_get(client, "/BumsCommonApiV01/Currency/list.api", query)["currencies"]
      end

      def taxes(client, query = {})
        custom_get(client, "/BumsCommonApiV01/Tax/list.api", query)["taxes"]
      end
    end
  end
end
