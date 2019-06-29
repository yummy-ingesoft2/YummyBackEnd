class CitiesController < ApplicationController
    before_action :set_city, only: [:show, :update, :destroy]
    before_action :authenticate_admin, only: [:index,:show,:create, :update, :delete]

def index
    #@cities = City.all.paginate(page: params[:page], per_page: 2)
    @cities = City.get_cities_names(params[:page])
    render json: @cities
end

  # GET /zombies/1
  def show
    respond_to do |format|
      format.html {render json: @city, status:201}
  	  format.pdf do 
  	    pdf = CityPdf.new(@city)
  	    send_data pdf.render, filename: "city_#{ @city.name}.pdf",
  	                          type: "application/pdf",
  	                          disposition: "inline"
  	  end
  	end
  end

  # POST /zombies
  def create
    @city = City.new(city_params)

    if @city.save
      render json: @city, status: :created, location: @city
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /zombies/1
  def update
    if @city.update(city_params)
      render json: @city
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # DELETE /zombies/1
  def destroy
    @city.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_params
      params.require(:city).permit(:name)
    end
end
