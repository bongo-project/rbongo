module Bongo
  module Response
    class Base
      attr_reader :code, :body

      def initialize(response)
        @code, @body = _code(response), _body(response)
      end
      
      def self.get_code(response)
        response[0..3].to_i
      end
    
      def self.delimit(responses)
        responses.split("\r\n")
      end
      
      protected
      def _code(response)
        response[0..3].to_i
      end
  
      def _body(response)
        response.slice(5, (response.size - 5))
      end
    end
  end
end