class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def new; end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.text = params[:post][:text]
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      redirect_to new_user_post_path
    end
  end
end
