class CooksController < ApplicationController
  #before_action :authenticate_cook, only: [:show, :current,:update,:delete]
  before_action :authenticate_admin, only: [:index,:all]
  before_action :set_cook, only: [:show, :update, :destroy]
    
def index
    #cities = City.find(params[:city_id])
    #cook = cities.cooks.paginate(page: params[:page], per_page: 10)
    #@products = cook.get_products
    @cooks = Cook.get_cooks_names(params[:city_id], params[:page])
    render json: @cooks, status:200
end
def all
  @cooks = Cook.all
  render json: @cooks, status:200
end

def show
	cities = City.find(params[:city_id])
  @cook = cities.cooks.find(params[:id])
	#@cook = Cook.get_cook(params[:city_id], params[:id])
	respond_to do |format|
    format.html
    format.json {render json: @cook, status:201}
	  format.pdf do 
	    pdf = CookPdf.new(@cook)
	    send_data pdf.render, filename: "cook_#{ @cook.name}.pdf",
	                          type: "application/pdf",
	                          disposition: "inline"
	  end
	end
end

def current
  render json: current_cook
end

def create
	cities = City.find(params[:city_id])
    cook = cities.cooks.new(cook_params)

    if cook.save
      UserMailer.new_user(cook).deliver_now
      render json: cook, status: :created, location: cities
    else
      render json: cook.errors, status: :unprocessable_entity
    end
end
def update
    if @cooks.update(cook_params)
      render json: @cooks
    else
      render json: @cooks.errors, status: :unprocessable_entity
    end
end

  # DELETE /zombies/1
def destroy
	@cooks.destroy
end

  private
    def set_cook
    	cities = City.find(params[:city_id])
        @cooks = cities.cooks.find(params[:id])
    end
    def cook_params
          params.require(:cook).permit(:name, :last_name, :gender,:birthdate,:tel,:email,:latitude,:longitude,:address,:user,:password,:city_id,:picture)
          
    end
end
