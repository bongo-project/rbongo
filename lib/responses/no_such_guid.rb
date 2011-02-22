module Bongo
  module Response
    class NoSuchGuid < Bongo::Response::Base
      def initialize()
        @body = "No such GUID"
    end
  end
end