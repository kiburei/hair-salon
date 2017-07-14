class Stylist
  attr_accessor(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    results = DB.exec("SELECT * FROM stylists;")
    stylists = []
    results.each do |stylist|
      stylists.push(Stylist.new(name: stylist.fetch('name', id: stylist.fetch('id'))))
    end
    stylists
  end

end
