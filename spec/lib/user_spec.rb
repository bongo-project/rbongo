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
    response.class.should == Bongo::Response::Ok
  end
  
  it "should return a bad authentication message if the password is incorrect" do
    response = @user.login('bongo', 'def')
    response.class.should == Bongo::Response::BadAuthentication
  end

  it "should return a bad authentication message if the username is incorrect" do
    response = @user.login('abc', 'bongo')
    response.class.should == Bongo::Response::BadAuthentication
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



# 13:11
# Lance Haig
# 13:11
# So I have thought of 2 recipe's a login to the server and listing of their folders and a login to the server and viewing one of the mails in the /mail/INBOX collection