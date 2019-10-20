class Admin::CustomersController < ApplicationController

before_action :ransack
	# def initialize
  #   @name = "last_name" + "first_name"
  # end

  PER = 8
  def index
    # name = "last_name" + "first_name"
    # @customer = Customer.where(id: params[:id])
    # @customer = Customer.find(params[:id])
    @customers = Customer.page(params[:page]).per(PER)
  end

  def show

    @customer = Customer.find_by(id: params[:id])

  end

  def purchase_history
    @customer = Customer.find_by(id: params[:id])
    # @orders = @customer.orders Orderモデルが出来上がってから設定
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


   def ransack
      @q = Product.ransack(params[:q])
    end

end


