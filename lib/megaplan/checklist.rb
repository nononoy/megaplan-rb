module Megaplan

  class Checklist < Api

    class << self

      def class_endpoint
        "/BumsCommonApiV01/Checklist/"
      end

      def update(client, query = {})
        custom_post(client, class_endpoint + "update.api", query)
      end

      def all(client, query = {})
        custom_get(client, class_endpoint + "all.api", query)["items"] rescue []
      end

      def toggle(client, query = {})
        custom_get(client, class_endpoint + "toggle.api", query)
      end

    end
  end

end
