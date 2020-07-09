class PortfolioDisplayController < ApplicationController
  get '/portfolio_displays' do
    portfolio = Portfolio.find(session[:last_viewed_portfolio_id])
    @portfolio_displays = PortfolioDisplay.where(portfolio: portfolio)
    erb :'portfolio_displays/index'
  end

  post '/portfolio_displays' do
    @portfolio = Portfolio.find(session[:last_viewed_portfolio_id])
    html = erb :'portfolios/show'
    display = PortfolioDisplay.new.tap do |d| 
      d.portfolio = @portfolio
      d.parse_html(html)
      d.set_stylesheet("default.css")
    end
    display.save
  
  end

  get '/portfolio_displays/new' do

  end

  get '/portfolio_displays/:id' do

  end
end