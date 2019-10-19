class Admin::ProductsController < ApplicationController
before_action :ransack

before_action :ransack

  PER = 5

  def new
    @product = Product.new
    @product.records.build

  end


  def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to admin_product_path(@product.id)
    else
      render 'new'
    end
  end

  def index
    @products = Product.all
    # @products = Product.where(params[:genre_id])

    @products = @q.result(distinct: true).page(params[:page]).per(PER)
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
    if @product.update(product_params)
       redirect_to admin_product_path(@product.id)
    else
      render 'edit'
    end
  end

  def destroy_confirm
    @product = Product.find(params[:id])

  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_path
  end

    def ransack
      @q = Product.ransack(params[:q])
    end

  private
    def product_params
      params.require(:product).permit(:name, :product_image, :product_status, :product_name, :artist_id, :genre_id, :label_id, :product_price, records_attributes: [:id, :disc_number, :song_title, :_destroy])
    end
    
end

