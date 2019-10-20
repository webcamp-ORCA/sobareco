class Public::OrdersController < ApplicationController

   before_action :ransack


# 　購入画面
   def new
     @order = Order.new
     @customer = current_customer
     @customers = Order.all

     # 売れた数だけレコードを取得してレコードロック
    arrival_managements = .lock.where(item_id: item_id).limit order_count

      # 在庫データが購入数取得できなければ、在庫切れとして例外を投げる
    if arrival_managements.count < order_count
      errors.add(:base, 'out of  arrival_management')
      raise ActiveRecord::RecordInvalid.new(self), 'out of arrival_management'
    end
     # 足りていればその在庫分削除
     arrival_managements.destroy_all

  end


  def create
    @order = Order.new
    @order.save
    redirect_to admin_products_path
  end

# 購入履歴詳細

  def show
  end


# 注文確認画面
  def order_confirm
    @orders = Order.all
  end

# 購入履歴
  def index
  end



   private
    def order_params
        params.require(:order).permit(:settlement_method,:delivery_preferred_date,:postage,:delivery_status,:total_amount,:addresses,:customer_id,:post_code,:prefectures,:municipality,:address,:address)
    end

   def ransack
      @q = Product.ransack(params[:q])
   end

end




