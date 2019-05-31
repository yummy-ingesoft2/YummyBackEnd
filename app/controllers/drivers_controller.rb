class DriversController < ApplicationController
before_action :set_driver, only: [:show, :update, :destroy]

def index
    @drivers = Driver.all
    render json: @drivers
end

  # GET /zombies/1
  def show
    render json: @driver
  end

  # POST /zombies
  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      render json: @driver, status: :created, location: @driver
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /zombies/1
  def update
    if @driver.update(driver_params)
      render json: @driver
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  # DELETE /zombies/1
  def destroy
    @driver.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def driver_params
      params.require(:driver).permit(:name,:last_name,:user,:password,:email)
    end
end
