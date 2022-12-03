require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/database_connection_setup'
require_relative './lib/database_connection'
require_relative './lib/space'

class MakersBNB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  DatabaseConnection.setup('makers_bnb')

  get '/' do
    redirect '/makersbnb'
  end

  get '/makersbnb' do
    erb :'/makersbnb/index'
  end

  get '/makersbnb/login' do
    erb :'/makersbnb/login'
  end

  get '/makersbnb/spaces' do
    @spaces = Space.all
    erb :'/makersbnb/spaces'
  end

  get '/makersbnb/add' do
    erb(:'makersbnb/add')
  end

  post '/makersbnb/add' do
    Space.add(params[:Name], params[:Description], params[:Price])
    redirect ('/makersbnb/add_confirmation')
  end

  get '/makersbnb/add_confirmation' do
    @space = Space.show_most_recent_space
    erb(:'makersbnb/add_confirmation')
  end

  get '/makersbnb/requests' do
    erb :'/makersbnb/requests'
  end

  post '/makersbnb/requests' do
    session[:approved_message] = "Your booking has now been approved"
    redirect '/makersbnb/approved'
  end

  get '/makersbnb/approved' do
    @approved_message = session[:approved_message]
    erb :'makersbnb/requests'
  end

  get '/makersbnb/signup' do
    erb :'makersbnb/signup'
  end

  post '/makersbnb/signup' do
    # @user = User.new(name: params["name"], username: params["username"], email: params["email"], password: params["password"])
    session[:name] = params[:name]
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/makersbnb/member'
  end

  get '/makersbnb/member' do
    @name = session[:name]
    # p @name
    erb :'/makersbnb/users/index'
  end

  run! if app_file == $0
end
