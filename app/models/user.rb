require 'digest/sha2'

class User < ActiveRecord::Base
  before_create {generate_token(:auth_token)}
  attr_accessible :password, :username, :email, :password_confirmation, :language, :admin, :last_login

  LANGUAGES = ["en", "hu"]

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true
  validates :password, :confirmation => true, :presence => true
  validate  :password_must_be_present

  has_many :guests

  class << self
    def authenticate(name, password)
      if user = find_by_username(name)
        if user.hashed_password == encrypt_password(password, user.salt)
        user
        end end
    end

    def encrypt_password(password, salt)
      Digest::SHA2.hexdigest(password + "wibble" + salt)
    end
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

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
  end
end
