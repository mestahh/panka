class Guest < ActiveRecord::Base
  attr_accessible :address, :birth, :city, :email, :mother, :name, :phone, :postal_code
  
  has_many :examinations
  
  validates :address, :birth, :city, :mother, :name, :phone, :postal_code, :presence => true
  #validates :email, :presence => true, :email => true
  
  def self.search(query)
  	query.nil? ? [] : where(['name like ?', "%#{query}%"])  
  end
end
