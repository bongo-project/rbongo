module Bongo
  module Response
    class SendDocument < Bongo::Response::Base
      def initialize()
        @body = "Send document"
    end
  end
end