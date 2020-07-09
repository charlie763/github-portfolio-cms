class PortfolioController < ApplicationController
  get '/portfolios' do
    @portfolios = Portfolio.where(user_id: session[:user_id])
    erb :'portfolios/index'
  end

  get '/portfolios/new' do

    erb :'portfolios/new'
  end

  post '/portfolios' do

    @portfolio = Portfolio.new(params)
    @portfolio.user = current_user
    @portfolio.save

    redirect "portfolios/#{@portfolio.id}/edit"
  end

  get '/portfolios/:id' do
    @portfolio = current_portfolio
    redirect_if_not_user(resource: @portfolio)
    session[:last_viewed_portfolio_id] = params[:id]

    erb :'portfolios/show'
  end

  get '/portfolios/:id/edit' do
    @portfolio = current_portfolio
    redirect_if_not_user(resource: @portfolio)

    user = current_user
    all_github_repos = user.all_github_repos
    saved_user_repos = Repo.where(user: user)
   

    if params[:refresh_repos] == "true"
      new_github_repos = user.new_github_repos(all_github_repos)
      @new_repos = Repo.make_from_github(user: user, github_repos: new_github_repos)
      @unselected_repos = saved_user_repos - @portfolio.repos
    else
      @new_repos = []
      @unselected_repos = []
    end

    if !@portfolio.repos.empty?
      @repos = @portfolio.repos
    elsif !saved_user_repos.empty?
      @repos = saved_user_repos
    else
      @repos = Repo.make_from_github(user: user, github_repos: all_github_repos)
    end

    erb :'portfolios/edit'
  end

  patch '/portfolios/:id' do
    portfolio = current_portfolio
    redirect_if_not_user(resource: portfolio)

    portfolio.update(name: params[:name]) unless params[:name] == ""
    portfolio.repos.clear
    params[:repos].keys.each do |repo_id|
      portfolio.repos << Repo.find(repo_id.to_i)
    end
  
    redirect "/portfolios/#{portfolio.id}"
  end

  delete '/portfolios/:id' do
    portfolio = current_portfolio
    redirect_if_not_user(portfolio)

    portfolio.delete
    redirect '/portfolios'    
  end
end