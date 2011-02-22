module Bongo
  class Collection
    attr_reader :items
    def initialize(collection)
      @items = collection.map {|item| CollectionItem.new(item.body) }
    end
  end
  
  class CollectionItem
    attr_reader :folder_id, :size, :something, :path
    def initialize(collection_item)
      delimited_item = collection_item.split(' ')
      @folder_id, @size, @something, @path = delimited_item[0], delimited_item[1], delimited_item[2], delimited_item[3]
    end
  end
end