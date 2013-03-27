class Examination < ActiveRecord::Base

  attr_accessible :anamnezis, :charge, :status, :treatment, :user_id
  
  belongs_to :user
  
end
