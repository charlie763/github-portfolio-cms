require 'dotenv/load'
require 'open-uri'
ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['APP_ENV'].to_sym)

configure :development do
  set :database, {adapter: "sqlite3", database: "db/#{ENV['SINATRA_ENV']}.sqlite"}
end

configure :production do
  set :database, {
    adapter: "postgresql", 
    url: "postgres://fbpqriyaiczmjm:9fd47ad0ea85ca2c8484abd54aec8dcdd8e5cb27df8738a784d46fef30586a92@ec2-52-202-66-191.compute-1.amazonaws.com:5432/d1od5ulj86qsup"
  }
end

require_all 'app'