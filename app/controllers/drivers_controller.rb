class DriversController < ApplicationController
before_action :set_driver, only: [ :update, :destroy]
before_action :authenticate_driver, only: [:show, :current ]

def index

    cities = City.find(params[:city_id])
    driver = cities.drivers
    render json:driver, status:200
    
end

  
  def show
    cities = City.find(params[:city_id])
    drivers = cities.drivers.find(params[:id])
	render json:drivers, status:201
  end
  def current
    render json: current_driver
  end

  def create
    cities = City.find(params[:city_id])
    driver = Driver.new(driver_params)

    if driver.save
      render json: driver, status: :created, location: cities
    else
      render json: driver.errors, status: :unprocessable_entity
    end
  end

  def update
    if @drivers.update(driver_params)
      render json: @drivers
    else
      render json: @drivers.errors, status: :unprocessable_entity
    end
  end

  
  def destroy
    @drivers.destroy
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      cities = City.find(params[:city_id])
      @drivers = cities.drivers.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def driver_params
      params.require(:driver).permit(:name,:last_name,:user,:password, :password_confirmation,:email,:city_id)
    end
end