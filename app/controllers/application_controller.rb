class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_candidate!
  before_action :authenticate_interviewer!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :linkedin, :angellist, skill:[], expertises:[]])
  end

end

