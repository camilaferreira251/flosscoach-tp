########################################
# File: omni_auth_login_controller.rb
# Porpose: Controler of omni auth login
# GNU AGPLv3
########################################
class OmniAuthLoginController < ApplicationController
  def index
    if current_user
      redirect_to projects_path
    else
      # nothing to do.
    end
  end

  # Create a new login with omni auth.

  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_with_omniauth(auth) # try to find user if not create with omniauth
    session[:user_id] = user.id
    redirect_to projects_path
  end

  # Redrect login when failure

  def failure
    redirect_to root_url
  end

  # Destroy login with omni auth and redirect for index.

  def destroy
    session.delete(:user_id)
    render action: 'index'
  end
end
