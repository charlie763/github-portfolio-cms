class UpdateReposSchema < ActiveRecord::Migration[6.0]
  def change
    add_column :repos, :github_id, :integer
  end
end
