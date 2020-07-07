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

    def current_user
      User.find(session[:user_id])
    end

    def current_portfolio
      Portfolio.find(params[:id])
    end
  end

end 