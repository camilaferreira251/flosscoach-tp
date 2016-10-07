########################################
# File:aplication_controler.rb
# Porpose: Controler of all aplication.
# GNU AGPLv3
########################################

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Define if the user do login or not and her permmissions.
  # set current user if does not exist
  def current_user
    # get user id if user have a register in FlossCoach 
    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id]) #get user user_id.
    else
      #nothing to do.
    end
  end
  helper_method :current_user
  
end
