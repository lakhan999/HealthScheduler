class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "You are not authorized to access this page."
  end

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :role, :first_name, :last_name, :mobile_number ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :role, :first_name, :last_name, :mobile_number  ])
  end
end
