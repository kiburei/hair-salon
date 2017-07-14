class Stylist
  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i()
  end

# return everything from class table in db
  def self.all
    results = DB.exec("SELECT * FROM stylists;")
    stylists = []
    results.each do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i
      stylists.push(Stylist.new(name: name, id: id))
    end
    stylists
  end

# save data to db
  def save
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

# Get single ecord from db
  def self.find(id)
    found_stylist = nil
    Stylist.all.each do |stylist|
      stylist.id.to_i==id ? found_stylist=stylist : "do nothing"
    end
    found_stylist
  end

# update records in db
  def update(attributes)
    @name = attributes.fetch('name')
    @id = self.id
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

# delete recoed from tanle stylists
  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
  end

end
