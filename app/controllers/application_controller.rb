class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def hello
    # Nothing to see here...
  end

  # How to have Devise route to a specific path upon a successful login.
  # https://github.com/plataformatec/devise/wiki/How-To%3A-Redirect-to-a-specific-page-on-successful-sign-in-and-sign-out
  def after_sign_in_path_for(resource)
    root_path
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

end
