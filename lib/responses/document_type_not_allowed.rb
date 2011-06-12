module Bongo
  module Response
    class DocumentTypeNotAllowed < Bongo::Response::Base
      def initialize()
        @body = "Document type not allowed"
      end
    end
  end
end