require_relative "../services/display_time.rb"

class Repo < ActiveRecord::Base
  include DisplayTime

  belongs_to :user
  has_and_belongs_to_many :portfolios
  
  def self.make_from_github(user:, github_repos:)
    github_repos.map do |repo_hash| 
      self.new(
          name: repo_hash["name"],
          github_url: repo_hash["html_url"],
          github_id: repo_hash["id"],
          description: repo_hash["description"],
          created_at: repo_hash["created_at"],
          updated_at: repo_hash["updated_at"]
        ).tap do |repo| 
          repo.user = user
          repo.save
        end
    end
  end

  def self.all_github_ids(user:)
    self.where(user: user).map{|repo| repo.github_id}
  end

end