module Bongo
  module Response
    class DatabaseLocked < Bongo::Response::Base
      def initialize()
        @body = "Database Locked"
    end
  end
end