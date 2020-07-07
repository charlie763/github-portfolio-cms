class Repo < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :portfolios

  def self.make_from_github(user:)
    github_repos = GithubApiResponse.new(github_username: user.github_username).get_repos
    github_repos.map do |repo_hash| 
      self.new(
        name: repo_hash["name"],
        github_url: repo_hash["html_url"],
        github_id: repo_hash["id"],
        description: repo_hash["description"],
        created_at: repo_hash["created_at"],
        updated_at: repo_hash["updated_at"]
      ).tap{|repo| repo.user = user}.save
    end
  end

  def self.all_github_ids(user:)

  end
  def self.update_from_github(user:)

  end

end