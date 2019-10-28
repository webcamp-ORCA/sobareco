class Admin::OrdersController < ApplicationController

before_action :ransack


  def index
  	@orders = Order.all
  end

  def update
  end

private

private
    def order_params
      params.require(:order).permit(:settlement_method,:postage,:delivery_status,:total_amount,:total_price,:addresses,:customer_id,:name,:post_code,:prefectures,:municipality,:address,:address)
    end

   def ransack
     @q = Product.ransack(params[:q])
   end

end
