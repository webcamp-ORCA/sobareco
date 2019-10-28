class Admin::OrdersController < ApplicationController


PER = 6
before_action :ransack

  def index
    @order = Order.new
  	@orders = Order.page(params[:page])
  end

   def create
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders


   end

  def update
     @order = Order.find(params[:id])
     @order.update(order_params)
     redirect_to admin_orders

  end


private
    def order_params
      params.require(:order).permit(:settlement_method,:postage,:delivery_status,:total_amount,:total_price,:addresses,:customer_id,:name,:post_code,:prefectures,:municipality,:address,:address)
    end

   def ransack
     @q = Product.ransack(params[:q])
   end

end
