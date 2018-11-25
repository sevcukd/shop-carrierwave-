class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@products = Product.all
  end
  def new
  @product = Product.new
  end
  def create
  	@product = current_user.products.build(product_params)
  	if @product.save
  		redirect_to  root_path
  	end
   
   
  end
  def show
  	@product = Product.find_by(id:params[:id])
  end
  def edit
  	
  end
  def update
  	
  end
  def destroy
  	
  end
   private
    def product_params
      params.require(:product).permit(:user_id, :title, :description, :price, {photos: []})
    end
end
