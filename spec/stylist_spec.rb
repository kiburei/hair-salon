require "rspec"
require "stylist"
require "pg"

DB = PG.connect(dbname: 'hair_salon_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
  end
end

describe(Stylist) do

  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all).to(eq([]))
    end
  end

end
