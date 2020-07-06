class CreatePortfolioRepos < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios_repos do |t|
      t.belongs_to :portfolio
      t.belongs_to :repo
    end
  end
end
