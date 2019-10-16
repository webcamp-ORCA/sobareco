class Admin::CustomersController < ApplicationController
<<<<<<< HEAD

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

<<<<<<< HEAD
  def edit
    @customer = Customer.find_by(id: params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to "/admin/customers/"
  end

  def destroy_confirm
=======
  def create
  end

  def edit
  end

  def update
>>>>>>> master
  end

  def destroy
  end

<<<<<<< HEAD
  private
  def customer_params
  	params.require(:customer).permit(:name)
  end
end

=======
  def destroy_confirm
  end
end
>>>>>>> master
