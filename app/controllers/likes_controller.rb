class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]
    if @like.save
      redirect_to user_post_path(current_user, @like.post)
    else
      render plain: 'error saving like'
    end
  end
end
