class OrdersController < ApplicationController
  #before_action :authenticate_client, only: [:index,:create,:show]
  #before_action :authenticate_driver, only: [:show]
  before_action :set_orders, only: [:show, :update, :destroy]
  before_action :authenticate_admin, only: [:all,:update,:delete]
  def index
    clients = Client.find(params[:client_id]) 
    order = clients.orders
    render json: order, status:200
  end
  def all
    @orders = Order.all
    render json: @orders, status:200
  end
  def show
    clients = Client.find(params[:client_id])
    @order = clients.orders.find(params[:id])
    #@order=Order.product(order)
    render json: @order, status:201
    respond_to do |format|
    format.html {render json: @order, status:201}
    format.json {render json: @order, status:201}
	  format.pdf do 
	    pdf = OrderPdf.new(@order)
	    send_data pdf.render, filename: "order_#{ @order.name}.pdf",
	                          type: "application/pdf",
	                          disposition: "inline"
	  end
	end
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
