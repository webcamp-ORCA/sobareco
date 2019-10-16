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
  end

  def create
    customer = Csutomer.new(customer_params)
    customer.save
    redirect_to '/admin/customers'
  end


  def destroy
  end


  private
  def customer_params
  	params.require(:customer).permit(:name)
  end
end


