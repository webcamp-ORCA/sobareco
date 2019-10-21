class Public::DeliveriesController < ApplicationController

  before_action :ransack

  def index
    @deliveries = Delivery.page(params[:page])
  end

  def new
    @deliveries = Delivery.new
  end


# (deliveries_params)
  def create
    @delivery = Delivery.new(deliveries_params)
    @delivery.customer_id = current_customer.id
      if @delivery.save
        redirect_to deliveries_path
      else
        @deliveries = Delivery.page(params[:page])
        render :index
    end


  end

  def edit
    @deliveries = Delivery.find_by(id: params[:id])
  end

  def update
    deliveries = Delivery.find(params[:id])
    deliveries.update
    redirect_to delivery_path(delivery.id)
  end

  def destroy
      deliveries = Delivery.find(params[:id])
      deliveries.destroy
      redirect_to deliveries_path
  end


private
    def deliveries_params
      params.require(:delivery).permit(:name, :post_code, :prefecture, :municipality, :address, :telephone)
    end

    def ransack
      @q = Product.ransack(params[:q])
    end

end
