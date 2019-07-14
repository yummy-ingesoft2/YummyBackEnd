class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    before_action :authenticate_cook, only: [:index,:show, :create,:update,:destroy]
    before_action :authenticate_client, only: [:index,:show]
    before_action :authenticate_admin, only: [:all]
def index
  #@products = Product.all  
  #cook = Cook.find(params[:cook_id])
    #cook = Cook.get_cook(params[:city_id], params[:cook_id])
    ##@products = Cook.get_products(params[:city_id], params[:cook_id]).paginate(page: params[:page], per_page: 10)
    @products = Product.get_products_info(params[:cook_id], params[:page])
    render json: @products, status:200
end
def all
  @products = Product.all
  render json: @products, status:200
end

def show
	cooks = Cook.find(params[:cook_id])
  @product = cooks.products.find(params[:id])
  #@product = Product.get_product(params[:cook_id], params[:id])
	respond_to do |format|
    format.html {render json: @product, status:201}
    format.json {render json: @product, status:201}
	  format.pdf do 
	    pdf = ProductPdf.new(@product)
	    send_data pdf.render, filename: "product_#{ @product.name}.pdf",
	                          type: "application/pdf",
	                          disposition: "inline"
	  end
	end
end
def rating
  product_1=Product.qualification(params[:cook_id])
  respond_to do |format|
    format.html {render json:product_1 ,each_serializer: Products::RatingSerializer,status:200}
	  format.pdf do 
	    pdf = ProductrPdf.new(product_1)
	    send_data pdf.render, filename: "product_#{ product_1.name}.pdf",
	                          type: "application/pdf",
	                          disposition: "inline"
	  end
	end
  
end

def create
    cook = Cook.find(params[:cook_id])
     product = cook.products.new(product_params)

    if product.save
      ProductNotifierJob.perform_later(cook,product)
      #NotificationMailer.new_product(cook , product).deliver_later
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

