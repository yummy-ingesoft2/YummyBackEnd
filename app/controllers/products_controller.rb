class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
def index
    cooks = Cook.find(params[:cook_id])
    product = cooks.products.paginate(page: params[:page], per_page: 10)
    render json:product, status:200
end
def show
	cooks = Cook.find(params[:cook_id])
    products = cooks.products.find(params[:id])
	render json:products, status:201
end
def create
	
    product = Product.new(product_params)

    if product.save
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

  # DELETE /zombies/1
def destroy
	@products.destroy
end
def set_product
	cooks = Cook.find(params[:cook_id])
    @products = cooks.products.find(params[:id])
end
def product_params
    params.require(:product).permit(:category, :name, :description,:cost,:cook_id)
      
end
end

