########################################
# File:users_controller.rb
# Porpose: Controler of user registe.
# GNU AGPLv3
########################################

class UsersController < ApplicationController

  # Indicates methods need set for controller work
  before_action :set_user, only: [:show, :update, :destroy]

  # Validate token if user are updated
  skip_before_filter :verify_authenticity_token, only: [:update]

  # GET /users
  def index
    redirect_to user_path(current_user)
  end

  def show
    @users = User.all
  end

  # GET /users/new
  def newuser
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.update
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.photo_url ||= '/assets/avatar.jpeg'
    if @user.save
      #UsuarioMailer.newuser(@user).deliver
      session[:user_id] = @user.id
      redirect_to projects_path
      #redirect_to @user
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update_attributes(user_params)
      respond_to do |format|
        format.json { render :json => { :status => 'Ok', :message => 'Received'}, :status => 200 }
      end    
    else
      render :edit
    end
  end

  private
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Only allow a trusted parameter 'white list' through.
    def user_params
      params.require(:user).permit!
      end
    end