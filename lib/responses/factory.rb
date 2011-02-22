module Bongo
  module Response
    class Factory
      def self.provide(response)
        responses = Bongo::Response::Base.delimit(response)
        # responses.each {|resp| puts "Delimited - #{resp}<br>"}
        
        values = responses.map do |response|
          code = Bongo::Response::Base.get_code(response)
          
        case code
          when 1000
            return Bongo::Response::Ok.new(response)
          when 2002
            return Bongo::Response::SendDocument.new(response)
          when 2053
            return Bongo::Response::SendRecipients.new(response)
          when 3000
            return Bongo::Response::UnknownCommand.new(response)
          when 3010
            return Bongo::Response::InvalidArguments.new(response)
          when 3011
            return Bongo::Response::InvalidGuid.new(response)
          when 3014
            return Bongo::Response::IlegalName.new(response)
          when 3015
            return Bongo::Response::DocumentTypeNotAllowed.new(response)
          when 3022
            return Bongo::Response::BadSyntax.new(response)
          when 3242
            return Bongo::Response::BadAuthentication.new(response)
          when 3241
            return Bongo::Response::IdentifyFirst.new(response)
          when 4100
            return Bongo::Response::StoreNotFound.new(response)
          when 4120
            return Bongo::Response::DatabaseLocked.new(response)
          when 4220
            return Bongo::Response::NoSuchGuid.new(response)
          when 4221
            return Bongo::Response::CollectionShared.new(response)
          when 4224
            return Bongo::Response::CollectionDoesNotExist.new(response)
          when 4225
            return Bongo::Response::DocumentDoesNotExist.new(response)
          when 4226
            return Bongo::Response::CollectionExists.new(response)
          when 4227
            return Bongo::Response::GuidExists.new(response)
          when 4228
            return Bongo::Response::CantWriteToMailbox.new(response)
          when 5004
            return Bongo::Response::CookieDatabaseError.new(response)
          when 5005
            return Bongo::Response::CollectionDatabaseError.new(response)
          when 5007
            return Bongo::Response::IndexLibraryError.new(response)
          when 5220
            return Bongo::Response::UserQuoteExceeded.new(response)
          when 5221
            return Bongo::Response::FreeDiskSpaceTooLow.new(response)
          when 5224
            return Bongo::Response::UserDoesNotExist.new(response)
          when 5260
            return Bongo::Response::DeliveryFailed.new(response)
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