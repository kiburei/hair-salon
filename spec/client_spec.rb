require "rspec"
require "client"
require "pg"

DB = PG.connect(dbname: 'hair_salon_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
  end
end

describe(Client) do

  describe('.all') do
    xit('starts off with no clients') do
      expect(Client.all).to(eq([]))
    end
  end

  describe(".find") do
      xit("returns a Client by her ID number") do
        test_client = Client.new({:name => "Sam", :id => nil})
        test_client.save()
        test_client2 = Client.new({:name => "Paul", :id => nil})
        test_client2.save()
        expect(Client.find(test_client2.id())).to(eq(test_client2))
      end
    end

    describe("#==") do
      xit("is the same Client if it has the same name and id") do
        Client = Client.new({:name => "Oceans Eleven", :id => nil})
        Client2 = Client.new({:name => "Oceans Eleven", :id => nil})
        expect(Client).to(eq(Client2))
      end
    end

    describe("#update") do
      xit("lets you update Clients in the database") do
        Client = Client.new({:name => "Oceans Eleven", :id => nil})
        actor = Actor.new({:name => "Rami Malek", :id => nil})
        actor1 = Actor.new({:name => "Brad Pitt", :id => nil})
        Client.save()
        actor.save()
        actor1.save()
        Client.update({:actor_ids => [actor.id, actor1.id]})
        expect(Client.actors()).to(eq([actor,actor1]))
      end
    end

    describe("#delete") do
      xit("lets you delete a Client from the database") do
        client = Client.new({:name => "Sam", :id => nil})
        client.save()
        client2 = Client.new({:name => "Paul", :id => nil})
        client2.save()
        client.delete()
        expect(Client.all()).to(eq([Client2]))
      end
    end

end
