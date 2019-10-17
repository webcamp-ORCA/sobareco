class Admin::ProductsController < ApplicationController


 def index
    # name = "last_name" + "first_name"
    # @customer = Customer.where(id: params[:id])
    # @customer = Customer.find(params[:id])
    @customers = Customer.all
    name = "last_name" + "first_name"
  end

  def show
    name = "first_name"
    @customer = Customer.find_by(id: params[:id])
  end

  def purchase_history
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to "/admin/customers/"
  end
  
  def destroy_confirm
  end

  def destroy
  end
end

