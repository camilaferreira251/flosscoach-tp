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
    # Crete a new login user with email valid params or alert user that params
    # are invalids. 
    user = User.find_by_email(params[:user][:email])
    assert(user.kind_of?(User))
    if user && user.valid_password?(params[:user][:password]) # check if user exists and if is a valid passoword
      session[:user_id] = user.id
      logger.info "created user login"
      redirect_to projects_path
    else
      flash.now[:alert] = 'Invalid e-mail or password.'
      render action: 'index'
    end
  end

  # User logout.
  def logout
    session.delete(:user_id)
    assert(session[:user_id] == nil)
    logger.info "logged out"
    render action: 'index'
  end

  # Search of projects for the user.
  def search
    @projects = Project.search(params[:query])
    assert(@projects.first.kind_of(Project))
    # Search params of project that user puts or in case that not exist
    # put user in idex page.
    if request.xhr? # check if request is ajax
      render :json => @projects.to_json
    else
      render :index
    end
  end
end
