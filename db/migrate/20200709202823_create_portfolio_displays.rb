class CreatePortfolioDisplays < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolio_displays do |t|
      t.string :name
      t.text :html
      t.text :stylesheet
      t.belongs_to :portfolio
    end
  end
end
