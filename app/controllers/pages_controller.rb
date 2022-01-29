class PagesController < ApplicationController
  def home
    # implement login to redirect to the user page
    @current_user_page = '/users/' + current_user.id.to_s
  end
end
