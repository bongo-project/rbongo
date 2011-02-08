module Bongo
  module Response
    class Factory
      def self.provide(response)
        responses = Bongo::Response::Base.delimit(response)
        responses.each {|resp| puts "Delimited - #{resp}<br>"}
        
        values = responses.map do |response|
          code = Bongo::Response::Base.get_code(response)
          
        case code
          when 1000
            return Bongo::Response::Ok.new(response)
          when 3000
            return Bongo::Response::UnknownCommand.new(response)
          when 3242
            return Bongo::Response::BadAuthentication.new(response)
          else
            return Bongo::Response::Base.new(response)
          end
        end

        return values.first unless values.length > 1
        values
      end
    end
  end
end