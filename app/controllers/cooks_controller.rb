class CooksController < ApplicationController
  before_action :authenticate_cook, only: [:show, :current]
  before_action :set_cook, only: [:show, :update, :destroy]
    
def index
    cities = City.find(params[:city_id])
    cook = cities.cooks
    render json:cook, status:200
end
def show
	cities = City.find(params[:city_id])
    cooks = cities.cooks.find(params[:id])
	render json:cooks, status:201
end

def current
  render json: current_cook
end

def create
	cities = City.find(params[:city_id])
    cook = Cook.new(cook_params)

    if cook.save
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
          params.require(:cook).permit(:name, :last_name, :gender,:birthdate,:tel,:email,:latitude,:longitude,:address,:user,:password,:city_id)
          
    end
end
