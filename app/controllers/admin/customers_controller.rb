class Admin::CustomersController < ApplicationController


	# def initialize
  #   @name = "last_name" + "first_name"
  # end

  def index
    # name = "last_name" + "first_name"
    # @customer = Customer.where(id: params[:id])
    # @customer = Customer.find(params[:id])
    @customers = Customer.all
  end

  def show

    @customer = Customer.find_by(id: params[:id])

  end

  def purchase_history
  end


  def edit
    # @customer = Customer.find_by(id: params[:id])
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer)
  end

  def destroy_confirm
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_customers_path
  end


  private
  def customer_params
  	params.require(:customer).permit(:name, :last_name, :first_name, :prefecture_name)
  end
end


