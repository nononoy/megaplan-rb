module Megaplan

  class Deal < Api

    class << self

      def class_endpoint
        "/BumsTradeApiV01/Deal/"
      end

      def find(client, query)
        scope = list(client)
        @arr = scope['deals']
        super
      end

    end
  end

end
