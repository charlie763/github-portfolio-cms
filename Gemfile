# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'sinatra'
gem 'require_all'
gem 'bcrypt'
gem 'rake'
gem 'rack'
gem 'shotgun'
gem 'json'
gem 'dotenv'
gem 'rack-flash3', :require => 'rack-flash'
gem 'nokogiri'

group :development do
  gem 'sqlite3'
  gem 'pry'
end

group :production do
  gem 'pg'
end