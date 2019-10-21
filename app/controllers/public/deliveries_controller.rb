class Public::DeliveriesController < ApplicationController

  before_action :ransack

  def index
    @deliveries = Delivery.page(params[:page])
  end

  def new
    @deliveries = Delivery.new
  end

  def create

    @deliveries = Delivery.new
        if @deliveries.save
        redirect_to new_delivery_path(@deliveries)
      else
        @deliveries = Deliver.page(params[:page])
        render :index
    end

  end

  def edit
    @deliveries = Delivery.find_by(id: params[:id])
  end

  def update
    deliveries = Delivery.find(params[:id])
    deliveries.update
    redirect_to deliveries_path
  end

  def destroy
    deliveries = Delivery.find(params[:id])
      deliveries.destroy
      redirect_to deliveries_path
  end


private
    def deliveries_params
      params.require(:deliveries).permit(:name, :post_code, :prefecture, :municipality, :address, :telephone)
    end
        def ransack
      @q = Product.ransack(params[:q])
        end

end

