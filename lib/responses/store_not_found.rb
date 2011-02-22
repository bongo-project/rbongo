module Bongo
  module Response
    class StoreNotFound < Bongo::Response::Base
      def initialize()
        @body = "Store Not Found"
    end
  end
end