module Bongo
  module Response
    class SendRecipients < Bongo::Response::Base
      def initialize()
        @body = "Send recipients"
    end
  end
end