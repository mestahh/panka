class Guest < ActiveRecord::Base
  attr_accessible :address, :birth, :city, :email, :mother, :name, :phone, :postal_code
  
  has_many :examinations
  
  def self.search(query)
  	name.nil? ? [] : where(['name like ?', "%#{query}%"])  
  end
end
