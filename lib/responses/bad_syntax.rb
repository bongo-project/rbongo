module Bongo
  module Response
    class BadSyntax < Bongo::Response::Base
      def initialize()
        @body = "Bad Syntax"
      end
    end
  end
end