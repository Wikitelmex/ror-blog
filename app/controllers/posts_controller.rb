class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:user_id])

    respond_to do |format|
      format.html
      format.json { render json: @user.posts }
    end
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def new; end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.text = params[:text]
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      redirect_to action: 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user)
  end
end
