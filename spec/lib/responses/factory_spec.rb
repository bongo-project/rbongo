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
  
  it "should return a invalid arguments response for a command with incorrect arguments" do
    response = Bongo::Response::Factory.provide("3010 Some message")
    response.class.should be Bongo::Response::InvalidArguments
  end
  
  it "should return a invalid guid response for a command with incorrect guid" do
    response = Bongo::Response::Factory.provide("3011 Some message")
    response.class.should be Bongo::Response::InvalidGuid
  end
  
  it "should return a illegal Name response for a command with illegal name" do
    response = Bongo::Response::Factory.provide("3014 Some message")
    response.class.should be Bongo::Response::IllegalName
  end
  
  it "should return a bad syntax response for a command with bad syntax" do
    response = Bongo::Response::Factory.provide("3022 Some message")
    response.class.should be Bongo::Response::BadSyntax
  end
  
  it "should return a identify first response for a failed stores command" do
    response = Bongo::Response::Factory.provide("3241 Some message")
    response.class.should be Bongo::Response::IdentifyFirst
  end
  
  it "should return a bad authentication response for a failed login command" do
    response = Bongo::Response::Factory.provide("3242 Some message")
    response.class.should be Bongo::Response::BadAuthentication
  end
  
  it "should return a store not found response for a failed store command" do
    response = Bongo::Response::Factory.provide("4100 Some message")
    response.class.should be Bongo::Response::StoreNotFound
  end
  
  it "should return a database locked response for a failed collection search command" do
    response = Bongo::Response::Factory.provide("4120 Some message")
    response.class.should be Bongo::Response::DatabaseLocked
  end
  
  it "should return a no such guid response for a failed collection search command" do
    response = Bongo::Response::Factory.provide("4220 Some message")
    response.class.should be Bongo::Response::NoSuchGuid
  end
  
  it "should return a collection shared response for a failed collection remove command" do
    response = Bongo::Response::Factory.provide("4221 Some message")
    response.class.should be Bongo::Response::CollectionShared
  end
  
  it "should return a collection does not exist response for a failed collection command" do
    response = Bongo::Response::Factory.provide("4224 Some message")
    response.class.should be Bongo::Response::CollectionDoesNotExist
  end
  
  it "should return a document does not exist response for a failed flag command" do
    response = Bongo::Response::Factory.provide("4225 Some message")
    response.class.should be Bongo::Response::DocumentDoesNotExist
  end
  
  it "should return a collection exists response for a failed collection create command" do
    response = Bongo::Response::Factory.provide("4226 Some message")
    response.class.should be Bongo::Response::CollectionExists
  end
  
  it "should return a guid exists response for a failed collection create command" do
    response = Bongo::Response::Factory.provide("4227 Some message")
    response.class.should be Bongo::Response::GuidExists
  end

  it "should return a cookie database error response for a damaged cookie database" do
    response = Bongo::Response::Factory.provide("5004 Some message")
    response.class.should be Bongo::Response::CookieDatabaseError
  end
  it "should return a collection database error response for a damaged collection database" do
    response = Bongo::Response::Factory.provide("5005 Some message")
    response.class.should be Bongo::Response::CollectionDatabaseError
  end
  
  it "should return a list of responses if a command so warrants" do
    response = Bongo::Response::Factory.provide("2001 admin\r\n2001 bongo\r\n1000 OK\r\n")
    response.length.should == 3
    response.first.code.should == 2001
    response.last.code.should == 1000
  end
end