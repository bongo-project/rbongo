module Bongo
  module Response
    class IllegalName < Bongo::Response::Base
      def initialize()
        @body = "The name is illegal"
    end
  end
end