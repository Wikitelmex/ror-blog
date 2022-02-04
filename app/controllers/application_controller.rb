class ApplicationController < ActionController::Base
  # all functionalities here, well be inhereted to the all the other controllers
  # def index
  # render html: 'hello rails' #this renders directly to html, but normally we use a template ERB
  # end
  protect_from_forgery with: :null_session

  before_action :authenticate_user

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  private
  def authenticate_user!(options = {})
    respond_to do |format|
      format.html do
        if user_signed_in?
          super
        else
          redirect_to new_user_session_path
        end
      end
      format.json do
        head :unauthorized unless signed_in?
      end
    end
  end

  def signed_in?
    @current_user_id.present?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        begin
          jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

          @current_user_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          head :unauthorized
        end
      end
    end
  end
end
