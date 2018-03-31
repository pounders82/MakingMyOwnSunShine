class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  # return this user with user id
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

  end

  # boolean that returns true if someone is logged in
  def logged_in?
      !!current_user
    end

  # Checks to see if user is logged in.  If not then redirect to the home page
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end

  end
end

