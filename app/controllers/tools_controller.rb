########################################
# File:tools_controller.rb
# Porpose: Controler of tools
# GNU AGPLv3
########################################

logger = Logger.new('logfile.log')

class ToolsController < ApplicationController
  #assert tools methods
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  # Impress all tools registred
  def index
    @tools = Tool.all
  end

  def show
  end

  # Create a new tool
  def new
    @tool = Tool.new
    assert(@tool.kind_of?(Tool))
  end
  logger.info('new'){'New tool created'}

  def edit
  end

  # Create tool, impress a sucess message or redirect user to register tool
  # again.
  def create
    # set a new tool to be used on view
    @tool = Tool.new(tool_params)
    assert(@tool.kind_of?(Tool))
    # if tool is saved redirect to tool
    # else render new form
    if @tool.save
      redirect_to @tool,
                  notice: 'Tool was successfully created.'
      logger.info "new tool"
    else
      render :new
    end
  end
  logger.info('create'){'New tool created'}
  Tool.create(name: 'Rubocop').valid?

  # Update tool
  def update
    #if tool is updated redirect to tool
    #else render edit form
    if @tool.update(tool_params)
      redirect_to @tool, 
                  notice: 'Tool was successfully updated.'
      logger.info "tool updated"
    else
      render :edit
    end
    assert(@tool.kind_of?(Tool))
  end
  logger.info('update'){'Toll updated'}

  # Destroy tool in the data banc
  private
    def destroy
      @tool.destroy
      redirect_to tools_url, 
                  notice: 'Tool was successfully destroyed.'
    end
  logger.info('destroy'){'Toll destroyed'}

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

        # Only allow a trusted parameter 'white list' through.
    def tool_params
      @name = 'tool' # Name of the tool
      params.require(:tool).permit(:name) # Define params of tools
    end
end
