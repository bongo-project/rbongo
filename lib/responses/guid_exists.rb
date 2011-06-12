module Bongo
  module Response
    class GuidExists < Bongo::Response::Base
      def initialize()
        @body = "The GUID already exists"
      end
    end
  end
end