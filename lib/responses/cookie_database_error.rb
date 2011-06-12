module Bongo
  module Response
    class CookieDatabaseError < Bongo::Response::Base
      def initialize()
        @body = "Cookie Database Error"
      end
    end
  end
end