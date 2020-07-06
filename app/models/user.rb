class User < ActiveRecord::Base
  has_secure_password
  has_many :portfolios
  has_many :repos
end