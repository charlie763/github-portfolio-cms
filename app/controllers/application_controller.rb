class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "#{ENV['SESSION_SECRET']}"
    set :views, "app/views"
  end
  
  get '/' do
    if logged_in?
      redirect '/portfolios'
    else
      redirect '/login'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
  end
end 