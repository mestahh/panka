class Guest < ActiveRecord::Base
  attr_accessible :address, :birth, :city, :email, :mother, :name, :phone, :postal_code, :user
  
  has_many :examinations
  belongs_to :user
  
  validates :address, :birth, :city, :mother, :name, :phone, :postal_code, :presence => true
  #validates :email, :presence => true, :email => true
  
  def self.search(query, user_id)
  	query.nil? ? [] : where(['name like ? and user_id = ?', "%#{query}%", "#{user_id}"])  
  end
end
