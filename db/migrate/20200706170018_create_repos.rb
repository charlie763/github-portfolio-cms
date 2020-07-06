class CreateRepos < ActiveRecord::Migration[6.0]
  def change
      create_table :repos do |t|
        t.string :name
        t.string :github_url
        t.text :description
        t.integer :user_id
      end
  end
end
