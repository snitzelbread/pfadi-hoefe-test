class ApplicationController < ActionController::Base
  # Define a helper method to check if a user is logged in
  helper_method :current_leiter, :logged_in?

  private

  # Check if the user is logged in
  def logged_in?
    current_leiter.present?
  end

  # Redirect the user if they are not logged in
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end

  # Assuming you have a method for current_leiter (current user)
  def current_leiter
    @current_leiter ||= Leiter.find(session[:leiter_id]) if session[:leiter_id]
  end
end
