module Bongo
  module Response
    class IdentifyFirst < Bongo::Response::Base
      def initialize()
        @body = "Authenticate first"
    end
  end
end