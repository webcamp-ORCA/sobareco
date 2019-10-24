class Public::CartItemsController < ApplicationController
before_action :ransack

  def index
    @cartitems = CartItem.where(:customer_id, current_customer.id)
  end

  def create
    cartitems = CartItem.new(cartitems_params)
    if @cartitems.save
       redirect_to cart_items_path(@cartitems.id)
    else
      render 'index'
    end
  end

  def update
    cartitems = CartItem.find(params[:id])
        cartitems.update(cartitems_params)
        redirect_to cart_items_path
  end

  def destroy
    cartitems = CartItem.find(params[:id])
    cartitems.destroy
    redirect_to cart_items_path
  end

private
    def ransack
      @q = Product.ransack(params[:q])
    end
end
