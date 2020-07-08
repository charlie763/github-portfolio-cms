class UpdateReposCreatedAt < ActiveRecord::Migration[6.0]
  def change
    change_column :repos, :created_at, :string
    change_column :repos, :updated_at, :string
  end
end
