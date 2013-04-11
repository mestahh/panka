require 'digest/sha2'

class User < ActiveRecord::Base
  attr_accessible :password, :username, :email
  
  validate  :password_must_be_present
  has_many :guests
  
  class << self
    def authenticate(name, password)
      if user = find_by_username(name)
        if user.hashed_password == encrypt_password(password, user.salt)
        user
        end end
    end

    def encrypt_password(password, salt) Digest::SHA2.hexdigest(password + "wibble" + salt)
    end end

  # 'password' is a virtual attribute
  def password=(password) 
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end end
    
  def password
    @password
  end
  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end end