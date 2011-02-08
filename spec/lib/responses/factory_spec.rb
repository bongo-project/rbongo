require File.dirname(__FILE__) + '/../../spec_helper'

describe Bongo::Response::Factory do
  it "should return an OK response for a command that was successful" do
    response = Bongo::Response::Factory.provide("1000 Some message\r\n")
    response.class.should be Bongo::Response::Ok
  end
  
  it "should return a unknown command response for a command that is not implemented" do
    response = Bongo::Response::Factory.provide("3000 Some message")
    response.class.should be Bongo::Response::UnknownCommand
  end
  
  it "should return a bad authentication response for a failed login command" do
    response = Bongo::Response::Factory.provide("3242 Some message")
    response.class.should be Bongo::Response::BadAuthentication
  end
  
  it "should return a list of responses if a command so warrants" do
    response = Bongo::Response::Factory.provide("2001 admin\r\n2001 bongo\r\n1000 OK\r\n")
    response.length.should == 3
    response.first.code.should == 2001
    response.last.code.should == 1000
  end
end