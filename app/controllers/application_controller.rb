class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(*%i(email password nickname))
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(*%i(email password nickname password_confirmation current_password))
    end
  end

  private

  def clear_session_errors
    session[:errors] = []
  end
end
