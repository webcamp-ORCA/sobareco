class Public::CartItemsController < ApplicationController

<<<<<<< HEAD
<<<<<<< .merge_file_zCowiM
=======
before_action :ransack

>>>>>>> .merge_file_F4ouhP
=======
before_action :ransack

>>>>>>> 9a8722a34cf8cb8c716a9ef07c7dd9ec20ba4ab2

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
