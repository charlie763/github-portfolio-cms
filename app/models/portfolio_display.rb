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

  def add_overlay
    Nokogiri::HTML(self.html).tap do |doc|
    container = doc.search("[class='container']").first
    overlay = <<-HTML
      <div class='overlay'>
        <p class='text-white'>This is what your portolio display would look like as a standalone page, for example, on your personal website.</p>
        <a href="/portfolio_displays/#{self.id}/edit" class="btn btn-primary btn-sm text-white my-1">View Source Code</a>        
        <a href="/portfolio_displays" class="btn btn-primary btn-sm text-white my-1">Back to Displays</a>        
      </div>
    HTML
    container.add_next_sibling(overlay)
    end.to_html
  end

  def html_as_code
    self.html.gsub("<","&lt;").gsub(">", "&gt;")
  end

  def code_as_html(html_code)
    html_code.gsub("&lt;", "<").gsub("&gt;", ">")
  end
end