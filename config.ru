require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/countries_controller.rb'

use Rack::Reloader
run CountriesController
