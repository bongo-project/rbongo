module Bongo
  module Response
    class BadAuthentication < Bongo::Response::Base
      def initialize()
        @body = "Authentication Problems"
      end
    end
  end
end