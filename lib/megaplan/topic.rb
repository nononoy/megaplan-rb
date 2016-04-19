module Megaplan

  class Topic < Api

    class << self

      def class_endpoint
        "/BumsDiscussApiV01/Topic/"
      end

      def toggle_topic(client, query = {})
        custom_post(client, class_endpoint + "toggleTopic.api", query)
      end

      def section_list(client, query = {})
        custom_get(client, class_endpoint + "sectionList.api", query)["sections"] rescue []
      end

    end
  end

end
