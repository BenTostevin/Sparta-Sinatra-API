require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/index_controller.rb'
require_relative './controllers/countries_controller.rb'


use Rack::Reloader
use Rack::MethodOverride

run Rack::Cascade.new([
  CountriesController,
  IndexController
  ])
