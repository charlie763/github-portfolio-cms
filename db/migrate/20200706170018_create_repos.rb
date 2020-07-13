class CreateRepos < ActiveRecord::Migration[6.0]
  ActiveRecord::Base.record_timestamps = false
  def change
      create_table :repos do |t|
        t.string :name
        t.string :github_url
        t.text :description
        t.integer :user_id
        t.timestamps
      end
  end
end
