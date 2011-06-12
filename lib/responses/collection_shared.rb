module Bongo
  module Response
    class CollectionShared < Bongo::Response::Base
      def initialize()
        @body = "Collection Shared"
      end
    end
  end
end