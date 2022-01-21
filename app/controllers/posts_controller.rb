class PostsController < ApplicationController
  def index
    @user_index = params[:user_id]
  end

  def show
    @user_index = params[:user_id]
    @post_index = params[:id]
  end
end
