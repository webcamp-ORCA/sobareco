class Admin::ProductsController < ApplicationController

<<<<<<< HEAD
  def new
    @product = Product.new
    @product.records.build
  end


  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end

  def index
    @products = Product.all
  end

  def show
    
  end

private
  def product_params
    params.require(:product).permit(:name, records_attributes: [:id, :disc_number, :song_title, :_destroy])
  end

=======
>>>>>>> master
end
