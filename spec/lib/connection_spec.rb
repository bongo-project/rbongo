require File.dirname(__FILE__) + '/../spec_helper'

describe Connection do
  it "should receive a unique session token when it opens" do
    connection = Connection.new('172.16.180.132', 689)
    
  end
end