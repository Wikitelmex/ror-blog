class CommentsController < ApplicationController
  def new
  end
  def create
    @comment = Comment.new
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    @comment.text = params[:comment][:text]
    @comment.save
    redirect_to user_post_path(current_user, params[:post_id])
  end
end