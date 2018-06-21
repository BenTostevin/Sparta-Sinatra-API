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

  # New
  get "/countries/new" do
    @country = {
      :id => "",
      :country_name => "",
      :continent => "",
      :population => "",
      :language => "",
      :world_cup => "",
    }

    erb :'countries/new'
  end

  # Show
  get "/countries/:id" do
    id = params[:id].to_i
    @country = $dummy_data[id]

    erb :'countries/show'
  end

  # Create
  post '/countries' do
    id = $dummy_data.last[:id] + 1

    new_post = {
      :id => id,
      :country_name => params[:country_name],
      :continent => params[:continent],
      :population => params[:population],
      :language => params[:language],
      :world_cup => params[:world_cup],
    }

    $dummy_data.push new_post

    redirect '/countries'
  end

  # Edit
  get '/countries/:id/edit' do
    id = params[:id].to_i

    @country = $dummy_data[id]
    erb :'countries/edit'
  end

  # Update
  put '/countries/:id' do
    "update"
  end

  # Destroy
  delete '/countries/:id' do
    "destroy"
  end



end
