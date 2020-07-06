class UserController < ApplicationController
  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      @invalid_input = true
      erb :'users/login'
    end
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      @invalid_input = true
      erb :'users/signup'
    else
      User.create(params)
      redirect 'login'
    end
  end
end