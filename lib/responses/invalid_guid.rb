module Bongo
  module Response
    class InvalidGuid < Bongo::Response::Base
      def initialize()
        @body = "The GUID is invalid"
      end
    end
  end
end