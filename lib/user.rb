class User
  def initialize(connection)
    @connection = connection
  end

  def login(username, password)
    @username, @password = username, password
    response = execute("auth user #{username} #{password}")
    response
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
    collection_response = execute("collections")
    Bongo::Collection.new(collection_response)
  end
  
  def list(path)
    list_response = execute("list #{path}")
    Bongo::List.new(list_response)
  end
  
  private
  def execute(command)
    # Bongo::Response::Factory.provide(@connection.send(command))
    @connection.send(command)
  end
end