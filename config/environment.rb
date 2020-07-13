require 'dotenv/load'
require 'open-uri'
#ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['APP_ENV'].to_sym)

configure :development do
  set :database, {adapter: "sqlite3", database: "db/#{ENV['SINATRA_ENV']}.sqlite"}
end

configure :production do
  set :database, {
    adapter: "postgresql", 
    database: "postgres://wppaachukvkzbu:30928a169e4edb65be8f89557ae74c43e77cdd8f2f2b4557fe824cb28f2675bd@ec2-52-202-66-191.compute-1.amazonaws.com:5432/db009ve2i4trao"
  }
end

require_all 'app'