class PostsController < ApplicationController
  def index
    @user_path = "/users/#{params[:user_id]}"
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end
end
