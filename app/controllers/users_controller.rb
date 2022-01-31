class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end
end
