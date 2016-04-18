module Megaplan

  class Event < Api

    class << self

      def class_endpoint
        "/BumsTimeApiV01/Event/"
      end

      def categories(client, query = {})
        custom_get(client, "/BumsTimeApiV01/Event/categories.api", query)['categories']
      end
    end
  end

end
