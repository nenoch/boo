ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  # set :environment, :development - different way of setting an environment to default mode

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

  get '/links/signup' do
    erb :'links/signup'
  end

  post '/links/signup' do
    user = User.create(email: params[:email], password: params[:password])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
