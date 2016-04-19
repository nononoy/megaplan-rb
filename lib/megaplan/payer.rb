module Megaplan

  class Payer < Api

    class << self

      def class_endpoint
        "/BumsCrmApiV01/Payer/"
      end

      def change_contractor(client, query = {})
        custom_post(client, class_endpoint + "changeContractor.api", query)
      end

      def list_fields(client, query = {})
        custom_get(client, class_endpoint + "listFields.api", query)
      end

    end
  end

end
