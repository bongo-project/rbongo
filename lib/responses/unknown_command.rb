module Bongo
  module Response
    class UnknownCommand < Bongo::Response::Base
      def initialize()
        @body = "The command is unknown"
    end
  end
end