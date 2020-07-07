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
    @portfolio.user = current_user
    @portfolio.save

    redirect "portfolios/#{@portfolio.id}/edit"
  end

  get '/portfolios/:id' do
    redirect_if_not_user
    @portfolio = current_portfolio
    session[:last_viewed_portfolio_id] = params[:id]
    erb :'portfolios/show'
  end

  get '/portfolios/:id/edit' do
    redirect_if_not_user

    user = current_user
    @portfolio = current_portfolio
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

    portfolio = current_portfolio
    portfolio.update(name: params[:name]) unless params[:name] == ""
    portfolio.repos.clear
    params[:repos].keys.each do |repo_id|
      portfolio.repos << Repo.find(repo_id.to_i)
    end
  
    redirect "/portfolios/#{portfolio.id}"
  end

  delete '/portfolios/:id' do
    redirect_if_not_user

    current_portfolio.delete
    redirect '/portfolios'    
  end
end