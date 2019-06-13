class OrdersController < ApplicationController
  #before_action :authenticate_client, only: [:create,:show]
  before_action :set_orders, only: [:show, :update, :destroy]
  def index
    clients = Client.find(params[:client_id]) 
    order = clients.orders
    render json: order, status:200
  end
  def show
    clients = Client.find(params[:client_id])
    order = clients.orders.find(params[:id])
  	render json:order, status:201
  end
  def create
    if current_client
    clients = Client.find(params[:client_id])
    order = clients.orders.new(order_params)
    order.driver_id = Driver.where("city_id = ?",city_id).take
    if order.save
      render json: order, status: :created  
    else
      render json: order.errors, status: :unprocessable_entity
    end
  else
  end
end
def update
  if @orders.update(order_params)
    render json: @orders
  else
    render json: @orders.errors, status: :unprocessable_entity
  end
end

# DELETE /zombies/1
def destroy
@orders.destroy
end

def set_orders
clients = Client.find(params[:client_id])
  @orders = clients.orders.find(params[:id])
end

  private

  def order_params
    params.require(:order).permit(:state,:order_date,:driver_id, :client_id)
  end
end
