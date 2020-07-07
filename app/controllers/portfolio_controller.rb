class PortfolioController < ApplicationController
  get '/portfolios' do
    redirect_if_not_user
    
    @portfolios = Portfolio.find_by(user_id: session[:user_id])
    erb :'portfolios/index'
  end

  get '/portoflios/new' do
    redirect_if_not_user
    
    @user = User.find(session[:user_id])
    erb :'portfolios/new'
  end

  get '/portoflios/:id' do
    redirect_if_not_user
  end

  get '/portoflios/:id/edit' do
    redirect_if_not_user
  end

  patch '/portoflios/:id' do
    redirect_if_not_user
  end

  delete '/portoflios/:id' do
    redirect_if_not_user
  end
end