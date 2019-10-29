class Public::CustomersController < ApplicationController
  #ユーザーのみアクセス権限を与える。
  # before_action :authenticate_customer!
  before_action :ransack

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      flash[:notice] ="ユーザー情報を変更しました。"
    redirect_to customer_path(customer.id)
    else
      render 'edit'
    end
  end

  def destroy_confirm
    @customer = Customer.find(params[:id])
  end

  def destroy

    customer = Customer.find(params[:id])
    customer.destroy


    flash[:notice] = "退会手続きが完了しました。"

  end

  private
  def customer_params
  	params.require(:customer).permit(:last_name, :first_name, :lastname_kana, :firstname_kana, :post_code, :municipality, :address, :telephone, :prefecture_id)
  end
  
  # def ensure_correct_user
  #   if current_customer.id !=params[:id].to_i
  #     redirect_to customer_path(current_customer.id)
  def ransack

    @q = Product.ransack(params[:q])
  end
end
