class OrderproductsController < ApplicationController
  before_action :set_orderproduct, only: [:show, :update, :destroy]

  # GET /orderproducts
  def index
    @orderproducts = Orderproduct.all
    render json: @orderproducts
  end

  # GET /orderproducts/1
  def show
    render json: @orderproduct
  end

  # POST /orderproducts
  def create
    @orderproduct = Orderproduct.new(orderproduct_params)
    #@orderproduct=@orderproducts.cost(:quantity)
    if @orderproduct.save
      render json: @orderproduct, status: :created, location: @orderproduct
    else
      render json: @orderproduct.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orderproducts/1
  def update
    if @orderproduct.update(orderproduct_params)
      render json: @orderproduct
    else
      render json: @orderproduct.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orderproducts/1
  def destroy
    @orderproduct.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderproduct
      @orderproduct = Orderproduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def orderproduct_params
      params.require(:orderproduct).permit(:quantity, :cost, :order_id, :product_id)
    end
end
