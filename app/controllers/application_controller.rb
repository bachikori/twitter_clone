# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname tel_number birthday])
  end

  def after_sign_in_path_for(_resource)
    root_path
  end

  def authenticate_user
    if current_user == nil
        redirect_to new_user_session_path
    end
end
end
