require 'socket'

hostname = '172.16.71.140'
port = '689'
user = 'bongo'
password = 'bongo'

streamSock = TCPSocket.new(hostname, port)

puts
puts "logging in"
puts
streamSock.send("auth user #{user} #{password}\n", 0) 
str = streamSock.recv(100000)
print str

# puts
# puts "Baking Cookie"
# puts
# streamSock.send('cookie bake 300\n', 0)
# cookiew = streamSock.recv(100000)
# print cookiew

puts
puts "Connecting to the store"
puts

streamSock.send("store #{user}\n", 0)
storeconnect = streamSock.recv(100000)
print storeconnect



# puts
# puts "Listing the collections/folders"
# puts
# 
# streamSock.send("collections\n", 0)
# collectionlist = streamSock.recv(100000)
# print collectionlist

puts
puts "listing mail in the inbox"
puts

streamSock.send("list /mail/INBOX\n", 0)
maillist = streamSock.recv(100000)
print maillist

streamSock.close