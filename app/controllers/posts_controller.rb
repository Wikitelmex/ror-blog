class PostsController < ApplicationController
  def index; end

  def show
    @user_index = params[:user_id]
    @post_index = params[:id]
  end
end
