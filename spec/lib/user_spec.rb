require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  before(:each) do
    @connection = Connection.new('172.16.68.165', 689, [])
    @user = User.new(@connection)
  end

  after(:each) do
    @connection.close
  end

  it "should return ok when a valid username and password are supplied" do
    response = @user.login('bongo', 'bongo')
    response.should be_true
  end
  
  it "should return a bad authentication message if the password is incorrect" do
    response = @user.login('bongo', 'def')
    response.should be_false
  end

  it "should return a bad authentication message if the username is incorrect" do
    response = @user.login('abc', 'bongo')
    response.should be_false
  end

  it "should know the collections available" do
    @user.login('bongo', 'bongo')
    @user.store()
    response = @user.collections()
  end

  it "should be able to choose the store it is working with" do
    @user.login('bongo', 'bongo')
    response = @user.store()
  end
  
  it "should be able to view the stores" do

  end
end