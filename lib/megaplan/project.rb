module Megaplan

  class Project < Api

    class << self

      def class_endpoint
        "/BumsProjectApiV01/Project/"
      end

      def action(client, query = {})
        custom_get(client, class_endpoint + "action.api", query)
      end

      def available_actions(client, query = {})
        custom_get(client, class_endpoint + "availableActions.api", query)
      end

      def available_actions_for_list(client, query = {})
        custom_get(client, class_endpoint + "availableActionsForList.api", query)
      end

      def can_create(client)
        custom_get(client, class_endpoint + "canCreate.api")
      end

      def convert(client, query = {})
        custom_post(client, class_endpoint + "convert.api", query)
      end

      def save_auditors(client, query = {})
        custom_post(client, class_endpoint + "saveAuditors.api", query)
      end

      def save_executors(client, query = {})
        custom_post(client, class_endpoint + "saveExecutors.api", query)
      end
    end
  end

end
