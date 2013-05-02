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
  
  def edit
    @image = ExamImage.find(params[:id])
  end
  
  def update
    @image = ExamImage.find(params[:exam_image][:id])
    @image.caption = params[:exam_image][:caption]
    @image.save
    redirect_to edit_examination_path(:id => params[:exam_image][:exam_id])
  end

end

