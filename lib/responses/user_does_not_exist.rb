module Bongo
  module Response
    class UserDoesNotExist < Bongo::Response::Base
      def initialize()
        @body = "The user does not exist"
      end
    end
  end
end