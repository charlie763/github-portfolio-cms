class PortfolioDisplay < ActiveRecord::Base
  belongs_to :portfolio
  
  def set_stylesheet(theme)
    self.stylesheet = File.read("./public/stylesheets/#{theme}")
  end

  def parse_html(html)
    doc = Nokogiri::HTML(html)
    
    #get rid of navbar
    navbar = doc.search("[id='navbar']")
    navbar.remove
 
    #get rid of buttons
    portfolio_buttons = doc.search("[id='modify-portfolio-buttons']")
    portfolio_buttons.remove
    repo_buttons = doc.search("[id='edit-repo-button']")
    repo_buttons.remove

    #get rid of main title, or just changet to Portfolio
    #title = doc.search("[id='portfolio-title']")

    self.html = doc.to_html
  end
end