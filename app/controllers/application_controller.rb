class ApplicationController < ActionController::Base
  # all functionalities here, well be inhereted to the all the other controllers
  # def index
  # render html: 'hello rails' #this renders directly to html, but normally we use a template ERB
  # end
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
