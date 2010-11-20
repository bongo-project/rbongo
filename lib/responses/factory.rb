module Bongo
  module Response
    class Factory
      def self.provide(response)
        responses = Bongo::Response::Base.delimit(response)

        values = responses.map do |response|
          code = Bongo::Response::Base.get_code(response)
          
          case code
          when 1000
            Bongo::Response::Ok.new(response)
          when 3000
             Bongo::Response::UnknownCommand.new(response)
          when 3242
            Bongo::Response::BadAuthentication.new(response) if code == 3242
          else
            Bongo::Response::Base.new(response)
          end
        end
        
        values.first unless values.size > 1
      end
    end
  end
end