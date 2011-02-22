module Bongo
  module Response
    class InvalidArguments < Bongo::Response::Base
      def initialize()
        @body = "The arguments are invalid"
    end
  end
end