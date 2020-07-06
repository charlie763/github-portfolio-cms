class UserController < ApplicationController
  get '/login' do
    erb :'users/login'
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