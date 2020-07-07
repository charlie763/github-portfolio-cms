class ChangeUserColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :github_url, :github_username
  end
end
