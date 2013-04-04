class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :guests
  
  validates  :password, :username, :presence => true
  
  has_many :guests
end
