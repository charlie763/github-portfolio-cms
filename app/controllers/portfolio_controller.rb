class PortfolioController < ApplicationController
  get '/portfolios' do
    redirect_if_not_user
    
    @portfolios = Portfolio.find_by(user_id: session[:user_id])
    erb :'portfolios/index'
  end

  get '/portoflios/new' do
    redirect_if_not_user
    
    erb :'portfolios/new'
  end

  post '/portfolios' do
    redirect_if_not_user

    @portfolio = Portfolio.new(params)
    @portfolio.user = User.find_by(session[:user_id])
    @portfolio.save

    erb :"portfolios/#{@portfolio.id}/edit"
  end

  get '/portoflios/:id' do
    redirect_if_not_user
  end

  get '/portoflios/:id/edit' do
    redirect_if_not_user

    user = User.find_by(session[:user_id])
    @portfolio = Portfolio.find_by(user: user)
    if !@portfolio.repos.empty?
      @repos = @portfolio.repos
    elsif repos = Repo.find_by(user: user)
      @repos = repos
    else
      github_repos = GithubApiResponse.new(github_username: user.github_username).get_repos
      @repos = github_repos.map{|repo_hash| Repo.create(
        name: repo_hash["name"],
        github_url: repo_hash["html_url"],
        description: repo_hash["description"],
        created_at: repo_hash["created_at"],
        updated_at: repo_hash["updated_at"]
      )}
    end

    erb :'portfolios/edit'
  end

  patch '/portoflios/:id' do
    redirect_if_not_user
  end

  delete '/portoflios/:id' do
    redirect_if_not_user
  end
end