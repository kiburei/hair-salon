class Client
  attr_reader(:name, :id, :stylist_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i()
    @stylist_id = attributes.fetch(:stylist_id).to_i
  end

# return everything from class table in db
  def self.all
    results = DB.exec("SELECT * FROM clients;")
    clients = []
    results.each do |client|
      name = client.fetch('name')
      id = client.fetch('id').to_i
      stylist_id = client.fetch('stylist_id').to_i
      clients.push(Client.new(name: name, id: id, :stylist_id => stylist_id))
    end
    clients
  end

# save data to db
  def save
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

# Get single ecord from db
  def self.find(id)
    found_client = nil
    Client.all.each do |client|
      client.id.to_i==id ? found_client=client : "do nothing"
    end
    found_client
  end

# update records in db
  def update(attributes)
    @name = attributes.fetch('name')
    @id = self.id
    @stylist_id = attributes.fetch('stylist_id')
    DB.exec("UPDATE clients SET name = '#{@name}', stylist_id = #{@stylist_id} WHERE id = #{@id};")
  end

# delete recoed from tanle clients
  def delete
    DB.exec("DELETE FROM clients WHERE id = #{self.id};")
  end

end
