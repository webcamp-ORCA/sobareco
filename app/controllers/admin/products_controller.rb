class Admin::ProductsController < ApplicationController
before_action :ransack

  PER = 5

  def new
    @product = Product.new
    @product.records.build

  end


  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "#{@product.product_name}を登録しました。"
       redirect_to admin_product_path(@product.id)
    else
      render 'new'
    end
  end

  def index
    if params[:genre_id]
      @products = Product.where(genre_id: params[:genre_id])
    elsif params[:q]
      @products = @q.result(distinct: true)
    else
      @products = Product.all.page(params[:page]).per(PER)
    end
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @records = @product.records
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       flash[:notice] = "#{@product.product_name}の情報を変更しました。"
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
    flash[:notice] = "商品を削除しました。"
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

