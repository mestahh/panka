class CommentsController < ApplicationController
  
  def create
    comment = Comment.new(params[:comment])
    comment.save
    redirect_to examination_path(:id => params[:comment][:commentable_id])
  end
end
