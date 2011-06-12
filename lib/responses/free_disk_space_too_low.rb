module Bongo
  module Response
    class FreeDiskSpaceTooLow < Bongo::Response::Base
      def initialize()
        @body = "Not enough free disk space"
      end
    end
  end
end