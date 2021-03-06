ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  # set :environment, :development - different way of setting an environment to default mode

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/links' do
    @links = Link.all
    @user = User.first
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    params[:tags].split(', ').each do |tag|
      link.tags << Tag.first_or_create(name: tag)
      link.save
    end
    redirect '/links'
  end

  get '/tags/:name' do |n|
    tag_name = n.gsub('_', ' ').split.map(&:capitalize).join(' ')
    @links = Tag.all(name: tag_name ).links
    @user = User.first
    erb :'links/index'
    # redirect '/links'

  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.id == nil
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    else
      session[:user_id] = @user.id
      redirect '/links'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/links'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
