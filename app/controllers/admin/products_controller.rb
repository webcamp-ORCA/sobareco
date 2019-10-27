class Admin::ProductsController < ApplicationController
before_action :ransack

  PER = 12

  def new
    @product = Product.new
    @disc = @product.discs.build
    @record = @disc.records.build

  end


  def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to admin_product_path(@product.id), success: "#{@product.product_name}を登録しました。"
    else
      render 'new'
    end
  end

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

    @stock = @product.arrival_managements.sum(:arrival_count) - @product.order_details.sum(:order_quantity)

  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       redirect_to admin_product_path(@product.id), success: "#{@product.product_name}の情報を変更しました。"
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
    redirect_to admin_products_path, danger: "商品を削除しました。"
  end


  private
    def product_params
      params.require(:product).permit(:name, :product_image, :product_status, :product_name, :artist_id, :genre_id, :label_id, :product_price, discs_attributes: [:id, :disc_no, :_destroy,records_attributes: [:id, :song_title, :_destroy]])
    end

    def ransack
      @q = Product.ransack(params[:q])
    end

end

