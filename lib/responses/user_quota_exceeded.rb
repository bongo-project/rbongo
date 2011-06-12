module Bongo
  module Response
    class UserQuotaExceeded < Bongo::Response::Base
      def initialize()
        @body = "The quota for the user has been exceeded"
      end
    end
  end
end