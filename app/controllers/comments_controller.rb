class CommentsController < ApplicationController
  
  def create
    comment = Comment.new(params[:comment])
    comment.save
    if (params[:comment][:commentable_type] == 'Examination')
      redirect_to examination_path(:id => params[:comment][:commentable_id])
    else 
      redirect_to guest_path(:id => params[:comment][:commentable_id])
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    if (params[:commentable_type] == 'Examination') 
      redirect_to examination_path(params[:commentable_id])
    else
      redirect_to guest_path(params[:commentable_id])
    end
  end
  
end
