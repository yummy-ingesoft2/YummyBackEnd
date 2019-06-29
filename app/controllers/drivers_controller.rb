class DriversController < ApplicationController

  #before_action :authenticate_driver, only: [:show, :current,:update,:delete]
  #before_action :authenticate_admin, only: [:index,:all]
  before_action :set_driver, only: [:show, :update, :destroy]
  
  def index
      #cities = City.find(params[:city_id])
      #driver = cities.drivers.paginate(page: params[:page], per_page: 10)
      @drivers = Driver.get_drivers_names(params[:city_id], params[:page])
      render json: @drivers, status:200
  end
  def all
    @drivers = Driver.all
    render json: @drivers, status:200
  end
    
    def show
      cities = City.find(params[:city_id])
      @driver = cities.drivers.find(params[:id])
      #@driver = Driver.get_driver(params[:city_id], params[:id])
      respond_to do |format|
        format.html {render json: @driver, status:201}
        format.json {render json: @driver, status:201}
    	  format.pdf do 
    	    pdf = DriverPdf.new(@driver)
    	    send_data pdf.render, filename: "driver_#{ @driver.name}.pdf",
    	                          type: "application/pdf",
    	                          disposition: "inline"
    	  end
    	end
    end
    
    
    def current
      render json: current_driver
    end
  
  
    def create
      cities = City.find(params[:city_id])
      driver = Driver.new(driver_params)
  
      if driver.save
        UserMailer.new_user(driver).deliver_now
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
        params.require(:driver).permit(:name,:last_name,:user,:password, :password_confirmation,:email,:city_id, :picture)
      end
  end