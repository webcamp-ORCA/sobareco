class Admin::ProductsController < ApplicationController

def new
  @product = Product.new
  @product.records.build
end


def create
  @product = Product.new(product_params)
  @product.save
  redirect_to admin_product_path(@product.id)
end

def index
  @products = Product.all
end

def show
  @product = Product.find(params[:id])
  @records = Record.all
end

def edit
  @product = Product.find(params[:id])
end

def update
  @product = Product.find(params[:id])
  @product.update(product_params)
  redirect_to admin_product_path(@product.id)
end

def destroy_confirm
  @product = Product.find(params[:id])
end

def destroy
  product = Product.find(params[:id])
  product.destroy
  redirect_to admin_products_path
end

private
  def product_params
    params.require(:product).permit(:name, :product_image, :product_status, :product_name, :artist_id, :genre_id, :label_id, :product_price, records_attributes: [:id, :disc_number, :song_title, :_destroy])
  end



 

end

