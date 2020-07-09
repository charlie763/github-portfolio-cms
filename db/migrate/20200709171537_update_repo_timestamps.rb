class UpdateRepoTimestamps < ActiveRecord::Migration[6.0]
  def change
    change_column :repos, :created_at, :datetime
    change_column :repos, :updated_at, :datetime
  end
end
