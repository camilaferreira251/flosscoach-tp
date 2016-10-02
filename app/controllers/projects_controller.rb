########################################
# File:projects_controller.rb
# Porpose: Controler of projects
# GNU AGPLv3
########################################

logger = Logger.new('logfile.log')

class ProjectsController < ApplicationController
  #assert project methods
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_project, only: [:new, :create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:update]

  # GET /projects
  def index
    @projects = Project.all.search(params[:search])
    if current_user
      @myproject = current_user.projects.build
    else
      @myproject = Project.all.search("nenhum")
    end
  end

  # GET /projects/1
  def show
    @codigourl = params[:id]
    @language = Language.where(:id => @project.language_id).first
    @tool = Tool.where(:id => @project.tool_id).first
    @operationalsystem = OperationalSystem.where(
      :id => @project.operational_system_id).first
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
    @languages = Language.all
    @tools = Tool.all
    @operationalsystems = OperationalSystem.all
  end
  logger.info('new'){"New project created"}

  # GET /projects/1/edit
  def edit
    @codigourl = params[:id]
    @language = Language.where(:id => @project.language_id).first
    @tool = Tool.where(:id => @project.tool_id).first
    @operationalsystem = OperationalSystem.where(:id => @project.operational_system_id).first
  end
  logger.info('edit'){"Project edited"}

  # POST /projects
  def create
    @project = current_user.projects.build(project_params)

    # If the flag pull of the openhug is on 
    if params[:openhub_check] 
      ohp = OpenHubProject.find_by_name(@project.name).first
      @project.about = "#{ohp.description} <br>
                       <iframe src='https://www.openhub.net/p/#{ohp.vanity_url}
                       /widgets/project_factoids_stats' 
                       scrolling='no' marginheight='0' marginwidth='0' 
                       style='height: 220px; width: 370px; border: none'></iframe>" 
      @project.image_url = ohp.medium_logo_url
      @project.link =  "OpenHub URL: <a href='#{ohp.html_url}'>#{ohp.html_url}</a><br>
                        Homepage Url: <a href='#{ohp.homepage_url}'>#{ohp.homepage_url}</a><br>
                        Download URL: <a href='#{ohp.download_url}'>#{ohp.download_url}</a>" 
    end
    else
      # nothing to do
    end
    @project.image_url ||= "assets/placeholder.png"

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end
  logger.info('create'){"New project created"}
  
  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      #redirect_to @project, notice: 'Project was successfully updated.'
      respond_to do |format|
        format.json { render :json => { :status => 'Ok', :message => 'Received'}, 
        :status => 200 }
      end
    else
      render :edit
    end
  end
  logger.info('update'){"Project updated"}
  
  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end
  logger.info('destroy'){"Project destroyed"}

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.all.find(params[:id])
      #@project = current_user.projects.find(params[:id])
    end

    # Varialbles declaration
    @name = "name"
    @project_description = "description"
    @project_page_url = "url"
    @about = "about"
    @project_issues = "issues"
    @technical_skill = "technical"
    @soft_skill = "soft"
    @contribution_flow = "flow"
    @workspace_setup = "workspace"
    @resource = "resource"
    @documentation = "documentation"
    @search_resource = "search"
    @link = "link"
    @send_contribution = "send"

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :project_description, 
        :project_page_url, :about, :project_issues, :technical_skill, 
        :soft_skill, :contribution_flow, :workspace_setup, :resource, 
        :documentation, :search_resource, :link, :send_contribution, 
        :user_id, :tool_id, :language_id, :operational_system_id)
    end

      # User need login for create a new project.
    def authorize_project
      unless current_user
        redirect_to root_path, alert: "You need to login to continue."
      end
    end
end
