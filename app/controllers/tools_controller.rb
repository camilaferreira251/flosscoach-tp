########################################
# File:tools_controller.rb
# Porpose: Controler of tools
# GNU AGPLv3
########################################

logger = Logger.new('logfile.log')

class ToolsController < ApplicationController
  #assert tools methods
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  # GET /tools
  def index
    @tools = Tool.all
  end

  # GET /tools/1
  def show
  end

  # GET /tools/new
  def new
    @tool = Tool.new
  end
  logger.info('new'){"New tool created"}

  # GET /tools/1/edit
  def edit
  end

  # POST /tools
  def create
    @tool = Tool.new(tool_params)

    if @tool.save
      redirect_to @tool, 
      notice: 'Tool was successfully created.'
    else
      render :new
    end
  end
  logger.info('create'){"New tool created"}

  # PATCH/PUT /tools/1
  def update
    if @tool.update(tool_params)
      redirect_to @tool, 
      notice: 'Tool was successfully updated.'
    else
      render :edit
    end
  end
  logger.info('update'){"Toll updated"}

  private
    def destroy
      @tool.destroy
      redirect_to tools_url, 
      notice: 'Tool was successfully destroyed.'
    end
  logger.info('destroy'){"Toll destroyed"}

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    @name = "tool"
    # Only allow a trusted parameter "white list" through.
    def tool_params
      params.require(:tool).permit(:name) #Define params of tools
    end
end
