require File.dirname(__FILE__) + '/../spec_helper'

describe Bongo::List do
  before(:each) do
    @list_response = [
      Bongo::Response::Base.new("2001 <guid> <type> <flags> <imapuid> <storetime> <documentsize> <filename>\r\n"),
      Bongo::Response::Base.new("2001 <guid> <type> <flags> <imapuid> <storetime> <documentsize> <filename>\r\n"),
      Bongo::Response::Base.new("2001 <guid> <type> <flags> <imapuid> <storetime> <documentsize> <filename>\r\n")
      ]
  end

  it "should return the contents of a path" do
    throw Bongo::List.new(@list_response)
  end
  
end