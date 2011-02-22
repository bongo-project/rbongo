module Bongo
  module Response
    class CantWriteToMailbox < Bongo::Response::Base
      def initialize()
        @body = "Cannot write to the desired mailbox."
      end
    end
  end
end