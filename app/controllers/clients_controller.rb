class ClientsController < ApplicationController
  before_action :authenticate_client, only: [:show, :current]
  before_action :set_client, only: [:show, :update, :destroy]

  def index
      #cities = City.find(params[:city_id])
      #client = cities.clients.paginate(page: params[:page], per_page: 10)
      @clients = Client.get_clients_names(params[:city_id], params[:page])
      render json: @clients, status:200
  end
  
  def show
  	#cities = City.find(params[:city_id])
    #clients = cities.clients.find(params[:id])
  	client = Client.get_client(params[:city_id], params[:id])
  	render json: client, status:201
  end	
  
  def current
    render json: current_client
  end
  
  def create
  	cities = City.find(params[:city_id])
      client = cities.clients.new(client_params)
  
      if client.save
        UserMailer.new_user(client).deliver_now
        render json: client, status: :created, location: cities
      else
        render json: client.errors, status: :unprocessable_entity
      end
  end
  def update
      if @clients.update(client_params)
        render json: @clients
      else
        render json: @clients.errors, status: :unprocessable_entity
      end
  end
  
    # DELETE /zombies/1
  def destroy
  	@clients.destroy
  end

  private
    def set_client
    	cities = City.find(params[:city_id])
        @clients = cities.clients.find(params[:id])
    end
    def client_params
          params.require(:client).permit(:name, :last_name, :gender,:birthdate,:email,:latitude,:longitude,:address,:user,:password,:city_id, :picture)
    end
end

