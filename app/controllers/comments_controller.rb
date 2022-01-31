class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def new; end

  def create
    @comment = Comment.new
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    @comment.text = params[:comment][:text]
    if @comment.save
      redirect_to user_post_path(current_user, params[:post_id])
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      redirect_to action: 'new'
    end
  end
end
