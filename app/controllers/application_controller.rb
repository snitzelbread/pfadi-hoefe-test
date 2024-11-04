class ApplicationController < ActionController::Base
  # Define a helper method to check if a user is logged in
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_parent, :logged_in_parent?
  before_action :initialize_shopping_list
  before_action :set_locale


  private

  def set_locale
    I18n.locale = :de
  end

  # Check if the user is logged in
  def logged_in_parent?
    current_parent.present?
  end

  # Redirect the user if they are not logged in
  def require_login_leader
    unless leader_signed_in?
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end

  def require_login_parent
    unless logged_in_parent?
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end

  def current_parent
    @current_parent ||= Parent.find(session[:parent_id]) if session[:parent_id]
  end

  def initialize_shopping_list
    session[:shopping_list] ||= [] # Only initialize if the session is nil, keeping existing data
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :email ])
  end
end
