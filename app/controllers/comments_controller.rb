class CommentsController < ApplicationController
  
  def create
    comment = Comment.new(params[:comment])
    comment.save
    redirect_to examination_path(:id => params[:comment][:commentable_id])
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to examination_path(params[:commentable_id])  
  end
  
end
