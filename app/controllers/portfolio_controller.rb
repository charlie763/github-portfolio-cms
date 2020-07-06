class PortfolioController < ApplicationController
  get '/portfolios' do
    redirect_if_not_user
    
    @portfolios = Portfolio.find_by(user_id: session[:user_id])
    erb :'portfolios/index'
  end

  get '/portoflios/new' do
    
  end

  get '/portoflios/:id' do

  end

  get '/portoflios/:id/edit' do

  end

  patch '/portoflios/:id' do

  end

  delete '/portoflios/:id' do

  end
end