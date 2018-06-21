class CountriesController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # Index
  get '/countries' do
    'index'
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
