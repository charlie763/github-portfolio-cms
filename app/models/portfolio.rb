require_relative '../services/display_time.rb'

class Portfolio < ActiveRecord::Base
  include DisplayTime

  belongs_to :user
  has_and_belongs_to_many :repos
  has_many :portfolio_displays
end
