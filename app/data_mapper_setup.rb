require 'data_mapper'
require 'dm-postgres-adapter'

require './app/models/link'
require './app/models/tag'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/book_manager_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
