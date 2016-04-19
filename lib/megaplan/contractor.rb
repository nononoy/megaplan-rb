module Megaplan

  class Contractor < Api

    class << self

      def class_endpoint
        "/BumsCrmApiV01/Contractor/"
      end

      def find(client, query)
        scope = list(client)
        @arr = scope['clients']
        super
      end

      def list_fields(client, query = {})
        custom_get(client, class_endpoint + "listFields.api", query)['Fields'] rescue []
      end

    end
  end

end
