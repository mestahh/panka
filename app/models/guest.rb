class Guest < ActiveRecord::Base
  attr_accessible :address, :birth, :city, :email, :mother, :name, :phone, :postal_code, :vip
  attr_accessible :user_id, :allergies, :diseases, :medicines, :vitamins, :hormon_treatment, :smoking, :sun_protector, :main_problem
  attr_accessible :litres_of_liquid_per_day, :problem_appeared, :possible_reason_of_problem, :visited_dermatologist
  has_many :examinations
  belongs_to :user
  has_many :comments, :as => :commentable
  validates :name, :phone, :presence => true
  
  def self.search(query, user_id)
  	query.nil? ? [] : where(['name like ? and user_id = ?', "%#{query}%", "#{user_id}"])  
  end
end
