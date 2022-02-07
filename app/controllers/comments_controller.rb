class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def index
    @comments = Comment.where(post_id: params[:post_id])

    respond_to do |format|
      format.html # no template implemented yet
      format.json { render json: @comments }
    end
  end

  def create
    @comment = Comment.new
    @comment.author_id = @current_user_id || current_user.id
    @comment.post_id = params[:post_id]
    @comment.text = params[:text]
    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_post_path(current_user, params[:post_id]) }
        format.json { render json: @comment }
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = @comment.errors.full_messages.to_sentence
          redirect_to action: 'new'
        end
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    if @comment.destroy
      redirect_to user_post_path(current_user, params[:post_id])
    else
      render plain: 'error deleting comment'
    end
  end
end
