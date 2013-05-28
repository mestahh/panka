class Guest < ActiveRecord::Base
  attr_accessible :address, :birth, :city, :email, :mother, :name, :phone, :postal_code, :vip
  attr_accessible :user_id

  has_many :examinations
  has_one :statistic
  belongs_to :user
  has_many :comments, :as => :commentable
  validates :name, :phone, :presence => true
  def self.search(query, user_id)
    query.nil? ? [] : where(['name like ? and user_id = ?', "%#{query}%", "#{user_id}"])
  end

  
end
