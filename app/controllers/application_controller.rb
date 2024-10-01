class ApplicationController < ActionController::Base
  # Define a helper method to check if a user is logged in
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_leiter, :logged_in_leiter?
  helper_method :current_parent, :logged_in_parent?
  before_action :initialize_shopping_list

  private

  # Check if the user is logged in
  def logged_in_leiter?
    current_leiter.present?
  end

  def logged_in_parent?
    current_parent.present?
  end
  # Redirect the user if they are not logged in
  def require_login_leiter
    unless logged_in_leiter?
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end

  def require_login_parent
    unless logged_in_parent?
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end

  # Assuming you have a method for current_leiter (current user)
  def current_leiter
    @current_leiter ||= Leiter.find(session[:leiter_id]) if session[:leiter_id]
  end

  def current_parent
    @current_parent ||= Parent.find(session[:parent_id]) if session[:parent_id]
  end

  def initialize_shopping_list
    session[:shopping_list] ||= []  # Only initialize if the session is nil, keeping existing data
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
