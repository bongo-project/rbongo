require 'socket'      # Sockets are in standard library
# 
hostname = '172.16.71.140'
port = '689'
user = 'bongo'
password = 'bongo'

socket= TCPSocket.new(hostname, port)
print socket.recv(10000)
socket.send("auth user bongo bongo\n", 0)
print socket.recv(10000)


__END__
class Connection
  attr_accessor :hostname, :port, :username, :password, :socket, :cookie
  
  def initialize(hostname, port, username, password)
    @hostname = hostname
    @port = port
    @username = username
    @password = password
    authorize
    #@cookie = set_cookie
  end
  
  def socket
    TCPSocket.new(@hostname, @port)
  end
  
  def recieve
    socket.recv(100000)
  end
  
  def authorize
    socket.send("auth user #{@username} #{@password}\n", 0) 
  end
  
  def set_cookie(length=300)
    socket.send("cookie bake #{length}\n", 0)
  end
  
  def authorize_with_cookie
    socket.auth("auth cookie #{cookie[1]}\n", 0)
  end
  
  def close
    socket.close
  end
end

def Store
  def collections
    socket.send("collections\n", 0)
  end
  
  def store
    socket.send("store #{@username}\n", 0)
  end
  
end

connection = Connection.new(hostname, port, user, password)

puts hostname
puts port
puts user
puts password

#connection.authorize
print connection.recieve
print connection.recieve



# Reference notes
# 
# hoptoad
# rest api




# 
# streamSock = TCPSocket.new(hostname, port)
# 
# puts
# puts "logging in"
# puts
# streamSock.send("auth user #{user} #{password}\n", 0) 
# str = streamSock.recv(100000)
# print str
# 
# # puts
# # puts "Baking Cookie"
# # puts
# # streamSock.send('cookie bake 300\n', 0)
# # cookiew = streamSock.recv(100000)
# # print cookiew
# 
# puts
# puts "Connecting to the store"
# puts
# 
# streamSock.send("store #{user}\n", 0)
# storeconnect = streamSock.recv(100000)
# print storeconnect
# 
# 
# 
# # puts
# # puts "Listing the collections/folders"
# # puts
# # 
# # streamSock.send("collections\n", 0)
# # collectionlist = streamSock.recv(100000)
# # print collectionlist
# 
# puts
# puts "listing mail in the inbox"
# puts
# 
# streamSock.send("list /mail/INBOX\n", 0)
# maillist = streamSock.recv(100000)
# print maillist
# 
# streamSock.close