class Public::CustomersController < ApplicationController
  before_action :ransack
  
  def show
    @customer = Customer.find_by(id: params[:id])
  end

  def edit
    @customer = Customer.find_by(id: params[:id])
  end

  def update
    customer = Customer.find_by(id: params[:id])
    if customer.update(customer_params)
      flash[:notice] ="ユーザー情報を変更しました。"
    redirect_to customer_path(customer.id)
    else
      render 'edit'
    end
  end

  def destroy_confirm
    @customer = Customer.find_by(id: params[:id])
  end

  def destroy
    customer = Customer.find_by(id: params[:id])
    customer.destroy

    flash[:notice] = "退会手続きが完了しました。"

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
