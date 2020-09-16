# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord', require: 'active_record'
gem 'bcrypt'
gem 'dotenv'
gem 'json'
gem 'nokogiri'
gem 'rack'
gem 'rack-flash3', require: 'rack-flash'
gem 'rake'
gem 'require_all'
gem 'shotgun'
gem 'sinatra'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'

group :development do
  gem 'pry'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
