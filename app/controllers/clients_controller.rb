class ClientsController < ApplicationController
def index
    cities = City.find(params[:city_id])
    client = cities.clients
    render json:client, status:200
end
def show
	cities = City.find(params[:city_id])
    clients = cities.clients.find(params[:id])
	render json:clients, status:201
end	

def create
	cities = City.find(params[:city_id])
    client = Client.new(client_params)

    if client.save
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
def set_client
	cities = City.find(params[:city_id])
    @clients = cities.clients.find(params[:id])
end
def client_params
      params.require(:client).permit(:name, :last_name, :gender,:birthdate,:email,:latitude,:longitude,:address,:user,:password,:city_id)
end
end

