# require the necessary  files
require "sinatra"
  require "sinatra/reloader"
  require "pg"
  require "./lib/client"
  require "./lib/stylist"
  also_reload "lib/**/*.rb"

# add postgres db to app
DB = PG.connect(dbname: 'hair_salon')
