module Megaplan

  class Task < Api

    class << self

      def class_endpoint
        "/BumsTaskApiV01/Task/"
      end

      def card(client, query = {})
        custom_get(client, "/BumsTaskApiV01/Task/card.api", query)['task']
      end

      def edit(client, query = {})
        custom_post(client, "/BumsTaskApiV01/Task/edit.api", query)
      end

      def action(client, query = {})
        custom_post(client, "/BumsTaskApiV01/Task/action.api", query)
      end

      def available_actions(client, query = {})
        custom_get(client, "/BumsTaskApiV01/Task/availableActions.api", query)
      end

    end
  end

end
