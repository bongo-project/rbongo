module Bongo
  module Response
    class CollectionDatabaseError < Bongo::Response::Base
      def initialize()
        @body = "Collection database error"
    end
  end
end