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
        custom_get(client, "/BumsCrmApiV01/Contractor/listFields.api", query)['Fields']
      end

    end
  end

end
