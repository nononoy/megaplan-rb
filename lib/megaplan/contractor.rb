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

    end
  end

end
