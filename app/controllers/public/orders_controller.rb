class Public::OrdersController < ApplicationController

   before_action :ransack


# 　購入画面
   def new
     @order = Order.new
     # @order = customer.build_address
     @customer = current_customer
     @carts = @customer.cartitems
     # 下で定義したtotal_priceメソッドを呼びだす
     total_price(@carts)
     @customers = Order.all
     @postage = Order.select("postage")
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to "/orders/#{@order.id}/order_confirm"
  end

# 購入履歴詳細

  def show
  end


# 注文確認画面
  def order_confirm
    @orders = Order.all
  end

# 購入履歴
  def index
  end



  private
  def order_params
      params.require(:order).permit(:settlement_method,:delivery_preferred_date,:postage,:delivery_status,:total_amount,:addresses,:customer_id,:post_code,:prefectures,:municipality,:address,:address)
  end

  def ransack
    @q = Product.ransack(params[:q])
  end
  def total_price(cartitems)
    @total_price = 0
    @total_amount = 0
    cartitems.each do |cartitem|
      # @total = @total + cartitem.product.product_price * purchase_quantity
      @total_price +=  cartitem.product.product_price * cartitem.purchase_quantity
      @total_amount += cartitem.purchase_quantity
    end
  end

end




