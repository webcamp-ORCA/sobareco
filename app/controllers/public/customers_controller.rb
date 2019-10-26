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

  # クレジット機能はここから
  # require "payjp"

  # def card_new
  #   customer = Customer.where(customer_id: current_customer.id)
  #   redirect_to action: "card_show" if card.exists?
  # end

  # def pay #payjpとCardのデータベースを作成するaction
  #   Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #   if params['payjp-token'].blank?
  #     redirect_to action: "card_new"
  #   else
  #     payuser = Payjp::Payuser.create(
  #       description: '登録テスト',
  #       email: current_user.email,
  #       card: params['payjp-token'],
  #       metadata: {customer_id: current_customer.id}
  #     )
  #     @customer = 
  #   end
  # end

  # def card_show
  # end

  # def card_create
  # end

  # def card_edit
  # end

  # def card_update
  # end

  # def card_destroy
  # end

  private
  def customer_params
  	params.require(:customer).permit(:last_name, :first_name, :lastname_kana, :firstname_kana, :post_code, :municipality, :address, :telephone, :prefecture_id)
  end
  
  def ransack

    @q = Product.ransack(params[:q])
  end
end
