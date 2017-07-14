# require the necessary  files
require "sinatra"
  require "sinatra/reloader"
  require "pg"
  require "./lib/client"
  require "./lib/stylist"
  also_reload "lib/**/*.rb"

# add postgres db to app
DB = PG.connect(dbname: 'hair_salon')

# root url
get('/') do
  @stylists = Stylist.all
  erb(:index)
end

post('/stylists')do
  name = params.fetch('name')
  stylist = Stylist.new(name: name, id: nil)
  stylist.save
  @stylists = Stylist.all
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist)
end
