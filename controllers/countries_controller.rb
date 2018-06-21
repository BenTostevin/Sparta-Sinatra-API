class CountriesController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $dummy_data = [ {
    :id => 0,
    :country_name => 'UK',
    :continent => 'Europe',
    :population => 70,
    :language => 'English',
    :world_cup => true
  },
  {
    :id => 1,
    :country_name => 'Australia',
    :continent => 'Oceanic',
    :population => 30,
    :language => 'English',
    :world_cup => false
  }
  ]

# Index
get '/countries' do
  @countries = $dummy_data

  erb :'countries/index'
end


get "/countries/new" do
  'new'
end

get "/countries/:id" do
  "show "
end

post '/countries' do
  'create'
end

get '/countries/:id/edit' do
  "edit"
end

put '/countries/:id' do
  "update"
end

delete '/countries/:id' do
  "destroy"
end



end
