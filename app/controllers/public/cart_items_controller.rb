class Public::CartItemsController < ApplicationController

before_action :ransack


  def index
    @cartitems_params = Cartitem.where(customer_id: current_customer.id)
  end

  def create
    carts = current_customer.cartitems
    #条件式　左辺：「カートに商品が入っているか。」右辺：「カートに入れる商品がすでにカートにあるか。」
    #左辺と右辺を 論理演算子&&(かつ)で結ぶ。
    unless carts != nil && carts.find_by(product_id: params[:cartitem][:product_id].to_i).blank?
      #条件式がfalseの場合、こちらの処理を行う
      @cartitem = carts.find_by(product_id: params[:cartitem][:product_id].to_i)
      @cartitem.purchase_quantity += 1
    else
      #条件式がtrueの場合、こちらの処理を行う
      @cartitem = Cartitem.new
      @cartitem.product_id  = params[:cartitem][:product_id].to_i
      @cartitem.purchase_quantity = 1
      @cartitem.customer_id = current_customer.id
    end

    if @cartitem.save
      redirect_to cart_items_path(@cartitem.id)
    else
      render 'index'
    end
  end

  def update
    @cartitem = Cartitem.find(params[:id])
    @cartitem.update(update_items_params)
    redirect_to cart_items_path, notice: "数量を変更しました"
  end

  def destroy
    cartitems = Cartitem.find(params[:id])
    cartitems.destroy
    redirect_to cart_items_path
  end

  private

    def update_items_params
      params.require(:cartitem).permit(:purchase_quantity)
    end

    def ransack

      @q = Product.ransack(params[:q])
    end
end
