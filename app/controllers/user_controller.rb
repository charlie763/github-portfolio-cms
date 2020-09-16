class UserController < ApplicationController
  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'Incorrect username or password'
      erb :'users/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.new(params)
    if user.valid?
      user.save
      redirect '/login'
    else
      error_hash = user.errors.messages
      flash[:notice] = error_hash.map { |k, v| k.to_s + ' ' + v[0]}.join(' and ')
      redirect '/signup'
    end
  end
end
