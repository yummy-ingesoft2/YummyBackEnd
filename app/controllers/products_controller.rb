class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    before_action :authenticate_cook, only: [:show, :create]
    
def index
  @products = Product.all  
  #cook = Cook.find(params[:cook_id])
    #cook = Cook.get_cook(params[:city_id], params[:cook_id])
    ##@products = Cook.get_products(params[:city_id], params[:cook_id]).paginate(page: params[:page], per_page: 10)
    #@products = Product.get_products_info(params[:cook_id], params[:page])
    render json: @products, status:200
end

def show
	#cooks = Cook.find(params[:cook_id])
  #products = cooks.products.find(params[:id])
	product = Product.get_product(params[:cook_id], params[:id])
	render json:product, status:201
end


def create
    cook = Cook.find(params[:cook_id])
     product = cook.products.new(product_params)

    if product.save
      NotificationMailer.new_product(cook , product).deliver_now
      render json: product, status: :created  
    else
      render json: product.errors, status: :unprocessable_entity
    end
end
def update
    if @products.update(product_params)
      render json: @products
    else
      render json: @products.errors, status: :unprocessable_entity
    end
end

def destroy
	@products.destroy
end
def set_product
	cooks = Cook.find(params[:cook_id])
    @products = cooks.products.find(params[:id])
end
def product_params
    params.require(:product).permit(:category, :name, :description,:cost,:cook_id,:photos)
      
end
end

