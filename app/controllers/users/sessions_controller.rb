class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @email = params[:email] || ''
    @password = params[:password] || ''
    super
  end

  # POST /resource/sign_in
  def create
    # binding.break
    if params[:user][:email].present? || params[:user][:password].present?
      user = User.find_by(email: params[:user][:email])
      if user.present? && user.valid_password?(params[:user][:password])
        sign_in(:user, user)
        redirect_to root_path
      else
        flash[:error] = 'Email or password is invalid'
        redirect_to new_user_session_path
      end
    else
      flash[:error] = 'Email and password cant be blank'
      redirect_to new_user_session_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
