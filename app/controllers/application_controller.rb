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
    def redirect_if_not_user 
      redirect '/login' unless logged_in?
    end
  end

end 