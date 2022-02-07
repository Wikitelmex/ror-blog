class Api::CommentsController < ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    render json: @comments
  end
end
