class Public::CustomersController < ApplicationController
  before_action :ransack
  def index
  end
  def show
    @customer = Customer.find_by(id: params[:id])
  end

  def edit
    @customer = Customer.find_by(id: params[:id])
  end

  def update
  end

  def destroy_confirm
    @customer = Customer.find_by(id: params[:id])
  end

  def destroy
    customer = Customer.find_by(id: params[:id])
    customer.destroy
    redirect_to("/products")
  end

  private
  def customer_params
  	params.require(:customer).permit(:name, :last_name, :first_name, :prefecture_name)
  end
  
  def ransack

    @q = Product.ransack(params[:q])
  end
end
