module Bongo
  class List
    attr_reader :items
    def initialize(list)
      @items = list.map {|item| ListItem.new(item) }
    end
  end
  
  class ListItem
    attr_reader :guid, :type, :flags, :imapuid, :storetime, :size, :filename
    def initialize(list_item)
      delimited_item = list_item.body.split(' ')
      @guid, @type, @flags, @imapuid = delimited_item[0], delimited_item[1], delimited_item[2], delimited_item[3]
      @storetime, @size, @filname = delimited_item[4], delimited_item[5], delimited_item[6]
    end
  end
end