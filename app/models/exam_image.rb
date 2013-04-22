class ExamImage < ActiveRecord::Base
  attr_accessible :examination_id, :image
  mount_uploader :image, ExamimageUploader
  
  belongs_to :examination
end
