class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :get_current_user

  def get_current_user
    current_user
  end

  def require_current_user
    unless @current_user
      flash[:error] = "You must be logged in to access that page."
      redirect_to signin_path
    end
  end

end
