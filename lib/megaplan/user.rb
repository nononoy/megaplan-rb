module Megaplan

  class User < Api

    class << self

      def info(client)
        custom_get(client, "/BumsCommonApiV01/UserInfo/id.api")
      end

      def block(client, query = {})
        custom_post(client, "/BumsCommonApiV01/UserAccount/block.api", query)
      end

      def unblock(client, query = {})
        custom_post(client, "/BumsCommonApiV01/UserAccount/unblock.api", query)
      end

    end

  end
end
