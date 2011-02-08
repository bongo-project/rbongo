class Connection
  def initialize(hostname, port, loggers=[])
    @instance = TCPSocket.new(hostname, port)
    @instance.recv(1000)
    @loggers = loggers
  end
  
  def send(message)
    @loggers.each {|logger| logger.info("#{message}") }
    @instance.send("#{message}\n", 0)
    
    responses = []
    # while Bongo::Response::Factory.provide(@instance.gets).class != Bongo::Response::Ok  # Read lines from the socket
    while response = @instance.gets
      unless response.nil? then
        puts "Got #{response}<br>"
        r = Bongo::Response::Factory.provide(response)
        if (r.class == Bongo::Response::Ok) or (r.class == Bongo::Response::BadAuthentication) or (r.class == Bongo::Response::UnknownCommand)
          break
        end
      end
    end
    r
      # if response[0..3] = "1000" then
      #   throw response
      # end
      # responses.push Bongo::Response::Factory.provide(response)
      # puts Bongo::Response::Factory.provide(response).inspect
    # end
    # @instance.recv(1000)
  end
  
  def close()
    @instance.close
  end
end