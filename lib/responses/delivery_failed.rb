module Bongo
  module Response
    class DeliveryFailed < Bongo::Response::Base
      def initialize()
        @body = "Delivery Failed"
      end
    end
  end
end