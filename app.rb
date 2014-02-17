require 'sinatra'
require 'net/http'
require 'json'
require 'uri'

def getRequest(endpoint, auth=false)
  uri = URI.parse(ENV['ECHELONS_API_URI'] + endpoint)
  http = Net::HTTP.new(uri.host, uri.port)
  req = Net::HTTP::Get.new(uri.request_uri)
  req.basic_auth ENV['ECHELONS_BASIC_AUTH_USER'], ENV['ECHELONS_BASIC_AUTH_PASS'] if auth
  response = http.request(req)
  return response
end

get '/' do
  # Get all the latest matches
  response = getRequest('/matches')

  if response.code == '200'
  	@matches = JSON.parse(response.body)
  else
  	@error = true
  end

  erb :index
end

get '/games' do
  # Get all the games
  response = getRequest('/games', true)

  if response.code == '200'
  	@games = JSON.parse(response.body)
  else
  	@error = true
  end

  erb :games
end

get '/users' do
  # Get all the games
  response = getRequest('/users', true)

  if response.code == '200'
  	@users = JSON.parse(response.body)
  else
  	@error = true
  end

  erb :users
end