class User < ActiveRecord::Base
  has_secure_password
  validates :username, :password, presence: true
  validates :username, uniqueness: true
  has_many :portfolios
  has_many :repos

  def all_github_repos
    GithubApiResponse.new(github_username: self.github_username).get_repos
  end

  def new_github_repos(github_repos)
    old_github_repo_ids = Repo.all_github_ids(user: self)
    github_repos.select{|repo_hash| !old_github_repo_ids.include?(repo_hash["id"])}
  end
end