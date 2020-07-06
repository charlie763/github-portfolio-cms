class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "#{ENV['SESSION_SECRET']}"
    set :views, "app/views"
  end
  
  get '/' do
    erb :index
  end
end 