class PortfolioDisplayController < ApplicationController
  get '/portfolio_displays' do
    portfolio = Portfolio.find(session[:last_viewed_portfolio_id])
    @portfolio_displays = PortfolioDisplay.where(portfolio: portfolio)
    erb :'portfolio_displays/index'
  end

  post '/portfolio_displays' do
    @portfolio = Portfolio.find(session[:last_viewed_portfolio_id])
    html = erb :'portfolios/show'
    display = PortfolioDisplay.new(params).tap do |d|
      d.portfolio = @portfolio
      d.parse_html(html)
      d.set_stylesheet('default.css')
    end
    display.save

    redirect "portfolio_displays/#{display.id}"
  end

  get '/portfolio_displays/new' do
    erb :'portfolio_displays/new'
  end

  get '/portfolio_displays/:id' do
    display = current_display
    redirect_if_not_user(resource: Portfolio.find(display.portfolio.id))
    File.write('./public/stylesheets/display.css', display.stylesheet)
    html_w_overlay = display.add_overlay
    erb(html_w_overlay, options = { layout: nil })
  end

  get '/portfolio_displays/:id/edit' do
    @display = current_display
    redirect_if_not_user(resource: Portfolio.find(@display.portfolio.id))
    erb :"portfolio_displays/edit"
  end

  patch '/portfolio_displays/:id' do
    display = current_display
    redirect_if_not_user(resource: Portfolio.find(display.portfolio.id))
    display.html = display.code_as_html(params[:html_code])
    display.stylesheet = params[:css_code]
    display.save
    redirect "portfolio_displays/#{display.id}"
  end

  delete '/portfolio_displays/:id' do
    display = current_display
    redirect_if_not_user(resource: Portfolio.find(display.portfolio.id))

    display.delete
    redirect '/portfolio_displays'
  end

  helpers do
    def current_display
      PortfolioDisplay.find(params[:id])
    end
  end
end
