class OperationalSystemsController < ApplicationController
  before_action :set_operational_system, only: [:show, :edit, :update, :destroy]

  # GET /operational_systems
  def index
    @operational_systems = OperationalSystem.all
  end

  # GET /operational_systems/1
  def show
  end

  # GET /operational_systems/new
  def new
    @operational_system = OperationalSystem.new
  end

  # GET /operational_systems/1/edit
  def edit
  end

  # POST /operational_systems
  def create
    @operational_system = OperationalSystem.new(operational_system_params)

    if @operational_system.save
      redirect_to @operational_system, notice: 'Operational system was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /operational_systems/1
  def update
    if @operational_system.update(operational_system_params)
      redirect_to @operational_system, notice: 'Operational system was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /operational_systems/1
  def destroy
    @operational_system.destroy
    redirect_to operational_systems_url, notice: 'Operational system was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operational_system
      @operational_system = OperationalSystem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def operational_system_params
      params.require(:operational_system).permit(:name)
    end
end
