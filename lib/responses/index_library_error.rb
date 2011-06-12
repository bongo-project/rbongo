module Bongo
  module Response
    class IndexLibraryError < Bongo::Response::Base
      def initialize()
        @body = "Index library error"
      end
    end
  end
end