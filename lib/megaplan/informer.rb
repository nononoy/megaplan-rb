module Megaplan

  class Informer < Api

    class << self

      def class_endpoint
        "/BumsCommonApiV01/Informer/"
      end

      def notifications(client, query = {})
        custom_get(client, class_endpoint + "notifications.api", query)["notifications"] rescue []
      end

      def deactivate_notification(client, query = {})
        custom_post(client, class_endpoint + "deactivateNotification.api", query)
      end

      def approvals(client, query = {})
        custom_get(client, class_endpoint + "approvals.api", query)
      end

      def approvals_count(client)
        custom_get(client, class_endpoint + "approvalsCount.api")["Count"] rescue nil
      end

    end
  end

end
