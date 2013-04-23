class ImagesController < ApplicationController
  
  def destroy
    @image = ExamImage.find(params[:id])
    @image.remove_image!
    @image.delete
    redirect_to edit_examination_path(:id => params[:exam_id]) 
  end
  
  def show
    @image = ExamImage.find(params[:id])
  end

end

