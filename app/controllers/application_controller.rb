class ApplicationController < ActionController::Base
  # Define a helper method to check if a user is logged in
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_shopping_list
  before_action :set_locale


  private

  def set_locale
    I18n.locale = :de
  end

  def require_login_leader
    unless leader_signed_in?
      redirect_to login_path, alert: "Du musst erst angemeldet sein!"
    end
  end

  def initialize_shopping_list
    session[:shopping_list] ||= [] # Only initialize if the session is nil, keeping existing data
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :email ])
  end
end
