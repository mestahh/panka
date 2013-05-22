class Examination < ActiveRecord::Base
  attr_accessible :anamnezis, :charge, :status, :treatment, :guest_id, :user_id
  
  belongs_to :guest
  belongs_to :user
  
  validates :anamnezis, :charge, :guest_id , :status, :treatment, :presence => true
  
  has_many :exam_images
  has_many :comments, :as => :commentable
end
