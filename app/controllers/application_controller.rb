class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_filter :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    # Add my attributes added to the devise User class
    #devise_parameter_sanitizer.for(:sign_up) << :first_name << :access
    devise_parameter_sanitizer.for(:account_update) << :first_name<< :access
    devise_parameter_sanitizer.for(:account_update) << :last_name<< :access
    devise_parameter_sanitizer.for(:account_update) << :about_me<< :access
  end

end
