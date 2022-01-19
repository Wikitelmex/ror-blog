class UsersController < ApplicationController
  def index; end

  def show
    @user_index = params[:id]
  end
end
