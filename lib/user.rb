class User
  def initialize(connection)
    @connection = connection
  end

  def login(username, password)
    @username, @password = username, password
    response = execute("auth user #{username} #{password}")
    response
    # return Bongo::Response::Ok.new(response)
    # response.class == Bongo::Response::Ok
  end

  def store()
    response = execute("store #{@username}")
    response.class == Bongo::Response::Ok
  end
  
  def stores()
    stores = execute("stores")
    stores.reject{|store| store.class == Bongo::Response::Ok}.map do |store|
      Bongo::Store::Factory.provide(store)
    end
  end
  
  def collections()
    collections = execute("collections")
    collections.map {|collection| Collection.new(collection) }
  end
  
  private
  def execute(command)
    # Bongo::Response::Factory.provide(@connection.send(command))
    @connection.send(command)
  end
end