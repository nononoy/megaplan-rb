module Megaplan

  class Employee < Api

    class << self

      def class_endpoint
        "/BumsStaffApiV01/Employee/"
      end

      def available_actions(client, query = {})
        custom_get(client, class_endpoint + "availableActions.api", query)
      end

      def departments(client)
        custom_get(client, "/BumsStaffApiV01/Department/list.api")["departments"] rescue []
      end

      def phone_types(client, query = {})
        custom_get(client, class_endpoint + "phoneTypes.api", query)["PhoneTypes"] rescue []
      end

      def can_create(client)
        custom_get(client, class_endpoint + "canCreate.api")["CanCreate"] rescue nil
      end

      def employees_online(client)
        custom_get(client, class_endpoint + "employeesOnline.api")["Ids"] rescue []
      end

    end
  end

end
