module Bongo
  module Store
    class Factory
      def provide(store)
        return Mail.new(store)
      end
    end
  end
end