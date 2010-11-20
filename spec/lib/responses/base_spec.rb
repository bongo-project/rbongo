require File.dirname(__FILE__) + '/../../spec_helper'

describe Bongo::Response::Base do
  before(:each) do
    @success_response = "1000 OK\r\n"
    @multiple_responses = "2001 admin\r\n2001 bongo\r\n1000 OK\r\n"
  end
  
  it "should know the message code" do
    response = Bongo::Response::Base.new(@success_response)
    response.code.should == 1000
  end
  
  it "should know the message body" do
    response = Bongo::Response::Base.new(@success_response)
    response.body.should == "OK"
  end
end