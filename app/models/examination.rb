class Examination < ActiveRecord::Base
  attr_accessible :anamnezis, :charge, :status, :treatment, :guest_id
  
  belongs_to :guest
  
  validates :anamnezis, :charge, :guest_id , :status, :treatment, :presence => true
end
