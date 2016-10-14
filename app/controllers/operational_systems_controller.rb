########################################
# File:operational_systems_controller.rb
# Porpose: Controler of all operational systems
# GNU AGPLv3
########################################

logger = Logger.new('logfile.log')

class OperationalSystemsController < ApplicationController
  before_action :set_operational_system, only: [:show, :edit, :update, :destroy]

  # Impress all operating sistems
  def index
    # variable that receives all operational systems
    @operational_systems = OperationalSystem.all
  end

  def show
  end

  # Create new operating system
  def new
    # variable that will be used on view to create a new operational system
    @operational_system = OperationalSystem.new
    assert(@operational_system.kind_of?(OperationalSystem))
  end
  logger.info('new'){'New operational system created'}

  def edit
  end

  # Create a new operational system, put message to user that sucess or redirect
  # user to register again.
  def create
    # varaible tahat receives params from view to create a new operational system
    @operational_system = OperationalSystem.new(operational_system_params)
    assert(@operational_system.kind_of?(OperationalSystem))
    if @operational_system.save
      redirect_to @operational_system, 
      notice: 'Operational system was successfully created.'
    else
      render :new
    end
  end
  logger.info('create'){'New operational system created'}
  OperationalSystem.create(name: 'Ubuntu').valid?

  # Update operating system data.
  def update
    if @operational_system.update(operational_system_params)
      redirect_to @operational_system, 
      notice: 'Operational system was successfully updated.'
    else
      render :edit
    end
    assert(@operational_system.kind_of?(OperationalSystem))
  end
  logger.info('update'){'Operational system updated'}

  # Destroy operating system in data banc
  def destroy
    @operational_system.destroy
    redirect_to operational_systems_url, 
                notice: 'Operational system was successfully destroyed.'
  end
  logger.info('destroy'){'Operational system destroyed'}

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operational_system
      @operational_system = OperationalSystem.find(params[:id])
    end

    # Only allow a trusted parameter 'white list' through.
    def operational_system_params
      params.require(:operational_system).permit(:name)
    end
end
