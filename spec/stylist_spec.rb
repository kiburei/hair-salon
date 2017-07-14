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
    xit('starts off with no stylists') do
      expect(Stylist.all).to(eq([]))
    end
  end

  describe(".find") do
      xit("returns a Stylist by her ID number") do
        test_stylist = Stylist.new({:name => "Sam", :id => nil})
        test_stylist.save()
        test_stylist2 = Stylist.new({:name => "Paul", :id => nil})
        test_stylist2.save()
        expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
      end
    end

    describe("#==") do
      xit("is the same Stylist if it has the same name and id") do
        Stylist = Stylist.new({:name => "Oceans Eleven", :id => nil})
        Stylist2 = Stylist.new({:name => "Oceans Eleven", :id => nil})
        expect(Stylist).to(eq(Stylist2))
      end
    end

    describe("#update") do
      xit("lets you update Stylists in the database") do
        Stylist = Stylist.new({:name => "Oceans Eleven", :id => nil})
        actor = Actor.new({:name => "Rami Malek", :id => nil})
        actor1 = Actor.new({:name => "Brad Pitt", :id => nil})
        Stylist.save()
        actor.save()
        actor1.save()
        Stylist.update({:actor_ids => [actor.id, actor1.id]})
        expect(Stylist.actors()).to(eq([actor,actor1]))
      end
    end

    describe("#delete") do
      xit("lets you delete a Stylist from the database") do
        stylist = Stylist.new({:name => "Sam", :id => nil})
        stylist.save()
        stylist2 = Stylist.new({:name => "Paul", :id => nil})
        stylist2.save()
        stylist.delete()
        expect(Stylist.all()).to(eq([Stylist2]))
      end
    end

end
