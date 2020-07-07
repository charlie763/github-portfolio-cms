class UpdateReposSchema < ActiveRecord::Migration[6.0]
  def change
    add_column :repos, :github_id, :integer
    add_column :repos, :created_at, :integer
    add_column :repos, :updated_at, :integer
  end
end
