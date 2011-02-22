module Bongo
  module Response
    class CollectionDoesNotFound < Bongo::Response::Base
      def initialize()
        @body = "Collection does not exist"
    end
  end
end