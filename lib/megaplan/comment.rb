module Megaplan

  class Comment < Api

    class << self

      def class_endpoint
        "/BumsCommonApiV01/Comment/"
      end

      def mark_as_read(client, query = {})
        custom_post(client, class_endpoint + "markAsRead.api", query)
      end

      def all(client, query = {})
        custom_get(client, class_endpoint + "all.api", query)["comments"] rescue []
      end

      def comment_by_id(client, query = {})
        custom_get(client, class_endpoint + "commentById.api", query)["comment"] rescue nil
      end


    end
  end

end
