class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def default_url_options
    result = super || {}
    if current_user.present?
      result.merge!(user_id: current_user.id)
    else
      result.delete(:user_id)
    end
    result
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
