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
          when 3010
            return Bongo::Response::InvalidArguments.new(response)
          when 3011
            return Bongo::Response::InvalidGuid.new(response)
          when 3014
            return Bongo::Response::IlegalName.new(response)
          when 3242
            return Bongo::Response::BadAuthentication.new(response)
          when 3241
            return Bongo::Response::IdentifyFirst.new(response)
          when 4100
            return Bongo::Response::StoreNotFound.new(response)
          when 4224
            return Bongo::Response::CollectionDoesNotExist.new(response)
          when 4226
            return Bongo::Response::CollectionExists.new(response)
          when 4227
            return Bongo::Response::GuidExists.new(response)
          when 5004
            return Bongo::Response::CookieDatabaseError.new(response)
          when 5005
            return Bongo::Response::CollectionDatabaseError.new(response)
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