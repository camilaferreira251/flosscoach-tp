# Controler of all aplication.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Define if the user do login or not and her permmissions.

  def current_user
    @current_user ||= 
    if session[:user_id]
      User.find_by_id(session[:user_id])
    else
      #nothing to do.
    end
  end
  helper_method :current_user
  
end
