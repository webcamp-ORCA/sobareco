class Public::ProductsController < ApplicationController
before_action :ransack

  PER = 12


  def index
    if params[:genre_id]
      @products = Product.where(genre_id: params[:genre_id]).page(params[:page]).per(PER)
    elsif params[:q]
      @products = @q.result(distinct: true).page(params[:page]).per(PER)
    else
      @products = Product.all.page(params[:page]).per(PER)
    end
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @discs = @product.discs
    @cart_item = Cartitem.new
  end



    def ransack
      @q = Product.ransack(params[:q])
    end

  private
    def product_params
      params.require(:product).permit(:name, :product_image, :product_status, :product_name, :artist_id, :genre_id, :label_id, :product_price, records_attributes: [:id, :disc_number, :song_title, :_destroy])
    end

    def ransack
      @q = Product.ransack(params[:q])
    end
end