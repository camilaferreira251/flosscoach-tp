########################################
# File:login_controler.rb
# Porpose: Controler of login.
# GNU AGPLv3
########################################
# Redirect user after login.
class LoginController < ApplicationController
  def index
    if current_user
      redirect_to projects_path
    else
      # nothing to do.
    end
  end

  # Create new user login.
  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      session[:user_id] = user.id
      redirect_to projects_path
    else
      flash.now[:alert] = 'Invalid e-mail or password.'
      render action: 'index'
    end
  end

  # User logout.
  def logout
    session.delete(:user_id)
    render action: 'index'
  end

  # Search of projects for the user.
  def search
    @projects = Project.search(params[:query])
    if request.xhr?
      render :json => @projects.to_json
    else
      render :index
    end
  end
end
