module Bongo
  module Response
    class DocumentDoesNotExist < Bongo::Response::Base
      def initialize()
        @body = "Document does not exist"
      end
    end
  end
end