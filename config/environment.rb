require 'dotenv/load'
require 'open-uri'
ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'].to_sym)

configure :development do
  set :database, {adapter: "sqlite3", database: "db/#{ENV['SINATRA_ENV']}.sqlite"}
end

configure :production do
  set :database, {
    adapter: "postgresql", 
    url: ENV['DATABASE_URL']
  }
end

require_all 'app'