class PortfolioController < ApplicationController
  get '/portfolios' do
    redirect_if_not_user
    
    @portfolios = Portfolio.where(user_id: session[:user_id])
    erb :'portfolios/index'
  end

  get '/portfolios/new' do
    redirect_if_not_user
    
    erb :'portfolios/new'
  end

  post '/portfolios' do
    redirect_if_not_user

    @portfolio = Portfolio.new(params)
    @portfolio.user = User.find(session[:user_id])
    @portfolio.save

    redirect "portfolios/#{@portfolio.id}/edit"
  end

  get '/portfolios/:id' do
    redirect_if_not_user
  end

  get '/portfolios/:id/edit' do
    redirect_if_not_user

    user = User.find(session[:user_id])
    @portfolio = Portfolio.find_by(user: user)
    if !@portfolio.repos.empty?
      @repos = @portfolio.repos
    elsif repos = Repo.where(user: user)
      @repos = repos
    else
      @repos = Repo.make_from_github(user: user)
    end

    erb :'portfolios/edit'
  end

  patch '/portfolios/:id' do
    redirect_if_not_user

    binding.pry
  end

  delete '/portfolios/:id' do
    redirect_if_not_user
  end
end