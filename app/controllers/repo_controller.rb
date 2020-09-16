class RepoController < ApplicationController
  get '/repos/:id/edit' do
    @repo = Repo.find(params[:id])
    redirect_if_not_user(resource: @repo)
    erb :'repos/edit'
  end

  patch '/repos/:id' do
    repo = Repo.find(params[:id])
    redirect_if_not_user(resource: repo)
    repo.update(name: params[:name]) unless params[:name].empty?
    repo.update(description: params[:description]) unless params[:description].empty?
    redirect "/portfolios/#{session[:last_viewed_portfolio_id]}"
  end
end
