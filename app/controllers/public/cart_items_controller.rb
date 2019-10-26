class Public::CartItemsController < ApplicationController
before_action :ransack


  def index
    @cartitems_params = Cartitem.where(customer_id: current_customer.id)
  end

  def create
    #binding.pry
    @cartitem = Cartitem.new
    @cartitem.product_id  = params[:cartitem][:product_id].to_i
    @cartitem.purchase_quantity = params[:cartitem][:purchase_quantity].to_i
    @cartitem.customer_id = current_customer.id
    if @cartitem.save
      redirect_to cart_items_path(@cartitem.id)
    else
      render 'index'
    end
  end

  def update
    @cartitem = Cartitem.find(params[:id])
    @cartitem.update(update_items_params)
        redirect_to cart_items_path
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
