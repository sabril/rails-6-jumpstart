class ApplicationController < ActionController::Base
  include Croutons::Controller
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end

  def layout_by_resource
    Rails.logger.info "#{controller_name} #{action_name}"
    if !devise_controller? || (controller_name == 'registrations' && (action_name == 'edit' || action_name == 'update'))
      "application"
    else
      "devise"
    end
  end
end
