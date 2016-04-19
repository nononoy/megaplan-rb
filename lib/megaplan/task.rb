module Megaplan

  class Task < Api

    class << self

      def class_endpoint
        "/BumsTaskApiV01/Task/"
      end

      def action(client, query = {})
        custom_get(client, class_endpoint + "action.api", query)
      end

      def available_actions(client, query = {})
        custom_get(client, class_endpoint + "availableActions.api", query)["actions"] rescue []
      end

      def deadline_change(client, query = {})
        custom_post(client, class_endpoint + "deadlineChange.api", query)
      end

      def deadline_action(client, query = {})
        custom_post(client, class_endpoint + "deadlineAction.api", query)
      end

      def save_executors(client, query = {})
        custom_post(client, class_endpoint + "saveExecutors.api", query)
      end

      def save_auditors(client, query = {})
        custom_post(client, class_endpoint + "saveAuditors.api", query)
      end

      def delegate(client, query = {})
        custom_post(client, class_endpoint + "delegate.api", query)
      end

      def check_delegate(client, query = {})
        custom_post(client, class_endpoint + "checkDelegate.api", query)
      end

      def employees_to_delegate(client, query = {})
        custom_post(client, class_endpoint + "employeesToDelegate.api", query)
      end

      def super_tasks(client, query = {})
        custom_post(client, class_endpoint + "superTasks.api", query)
      end

      def super_projects(client, query = {})
        custom_post(client, class_endpoint + "superProjects.api", query)["projects"] rescue []
      end

      def convert(client, query = {})
        custom_post(client, class_endpoint + "convert.api", query)
      end

    end
  end

end
