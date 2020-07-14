class GithubApiResponse
  BASE_PATH = "https://api.github.com"
  attr_reader :github_username

  def initialize(github_username:)
    @github_username = github_username
  end

  def test_response
    path = "#{BASE_PATH}/users/#{github_username}"
    URI.parse(path).open
  end

  def get_repos
    page = 1
    full_response = []
    response = "default"
    while !response.empty? 
      path = "#{BASE_PATH}/users/#{github_username}/repos?page=#{page}&per_page=100"
      uri = URI.parse(path)
      response = JSON.parse(uri.open.read)
      full_response += response
      page += 1
    end

    desired_keys = ["name", "html_url", "description", "created_at", "updated_at", "id"]
    full_response.map do |repo| 
      repo.select{|k,v| desired_keys.include?(k)}
    end
  end
end