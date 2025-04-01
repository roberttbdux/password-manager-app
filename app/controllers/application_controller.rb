class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.

  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :null_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  # After sign in path for Devise
  def after_sign_in_path_for(resource)
    dashboard_path  # or any path you want to redirect to, for example: root_path
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
end
