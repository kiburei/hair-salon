class Stylist
  attr_accessor(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

# return everything from class table in db
  def self.all
    results = DB.exec("SELECT * FROM stylists;")
    stylists = []
    results.each do |stylist|
      stylists.push(Stylist.new(name: stylist.fetch('name', id: stylist.fetch('id'))))
    end
    stylists
  end

# save data to db
  def save
    DB.exec("INSERT INTO stylists (name) VALUES ('#{self.name}')")
  end

# Get single ecord from db
  def self.find(id)
    result = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
    stylist = nil
    result.each do |s|
      stylist = Stylist.new(name: s.fetch('name', id: s.fetch('id')))
    end
    stylist
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
