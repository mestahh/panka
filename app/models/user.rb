class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  
  validates  :password, :username, :presence => true
end
