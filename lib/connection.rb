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
      throw response
      if(response.nil? == false) then
        r = Bongo::Response::Factory.provide(response)
        if (r.class == Bongo::Response::Ok) 
          break
        end
      end
    end
        puts r.inspect
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