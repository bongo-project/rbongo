module Bongo
  module Response
    class CollectionExists < Bongo::Response::Base
      def initialize()
        @body = "Collection Exists"
    end
  end
end