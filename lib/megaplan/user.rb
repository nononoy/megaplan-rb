module Megaplan

  class User < Api

    class << self
      def info(client)
        custom_get(client, "/BumsCommonApiV01/UserInfo/id.api")
      end
    end

  end
end
