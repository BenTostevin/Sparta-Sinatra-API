require 'httparty'
require 'json'
class CountriesController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # Index
  get '/countries' do
    @countries = HTTParty.get('http://sparta-example-3.herokuapp.com/countries')

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
    #
    #
    # @country = HTTParty.find('http://sparta-example-3.herokuapp.com/countries')
    @id = params[:id].to_i - 1
    @country = HTTParty.get('http://sparta-example-3.herokuapp.com/countries')

    erb :'countries/show'
  end

  # Create
  post '/countries/' do
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
    @id = params[:id].to_i

    @country = HTTParty.get('http://sparta-example-3.herokuapp.com/countries')
    erb :'countries/edit'
  end

  # Update
  put '/countries/:id' do

    id = params[:id].to_i

    response = HTTParty.get('http://sparta-example-3.herokuapp.com/countries')['data']

    country = Hash.new

    response.each do |res|
      if res['id'] == id
        country[:country_name] = params[:country_name]
        country[:continent] = params[:continent]
        country[:population] = params[:population]
        country[:language] = params[:language]
        country[:world_cup] = params[:world_cup]
      end
    end

    puts country.to_json

    HTTParty.put('http://sparta-example-3.herokuapp.com/countries',:body => country.to_json, :headers => {'Content-Type' => 'application/x-www-form-urlencoded'} )


    # response = HTTParty.put('http://sparta-example-3.herokuapp.com/countries',:body => country.to_json,:headers => { "Content-Type" => 'application/json'})
    # puts response.body

    redirect '/countries'
  end

  # Destroy
  delete '/countries/:id' do
    id = params[:id].to_i

    $dummy_data.delete_at id

    redirect "/countries"

    "destroy"
  end



end
