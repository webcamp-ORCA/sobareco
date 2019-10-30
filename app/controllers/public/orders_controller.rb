class Public::OrdersController < ApplicationController

   before_action :ransack

  PER = 6

# 購入画面
  def new
    #お届け先住所と
      @order = Order.new
    #下でログイン中のユーザーの住所を表示と配送先住所一覧を表示
      @customer = current_customer
      @carts = @customer.cartitems
     # 下で定義したtotal_priceメソッドを呼びだす
     total_price(@carts)
      # @customers = Order.all
  end

# 注文確認画面
  def order_confirm
     # @customer = current_customer.id
     #もし注文したユーザーのアドレスがユーザー自身のアドレスだったら
    if params[:order][:addresses] == "user_address"
       # ユーザーの郵便番号と住所を表示

      @address = current_customer.prefecture + current_customer.municipality + current_customer.address

      @addresses = "user_address"
    else
      # ユーザー以外のアドレスだったら
      # delivery = Delivery.find(params[:order][:addresses].to_i)
      #ユーザー以外の指定した配送先を表示
      # @address = delivery.name + delivery.post_code + delivery.prefecture.name# @order = Order.find(params[:id])
    # @order.update(order_params)
    # redirect_to admin_orders + delivery.address
      @addresses = params[:order][:addresses].to_i
    end
    # 決済方法を保存
    @order = Order.new

    @addresses = params[:order][:addresses]
    # 支払い方法を保存
    @settlement_method = params[:order][:settlement_method]
    # 合計金額を保存
    @total_price = params[:order][:total_price]
    # 合計数量を保存
    @toatal_amount = params[:order][:total_amount]
    #カートアイテムの購入数を保存
    # @order_quantity =params[:orere_detail][:order_quantity]
    @customer = current_customer


    #item.destroy （カートのアイテムを削除)
  end

  def create
    # binding.pry
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.settlement_method = params[:order][:settlement_method]
    @order.addresses = params[:order][:addresses]
    # address = Delivery.find params[:order][:addresses]
    @toatal_amount = params[:order][:total_amount]
   
    # @order.post_code = params[:order][:post_code]
    # @order.address = params[:order][:addres]

     # @customer = current_customer.id
     #もし注文したユーザーのアドレスがユーザー自身のアドレスだったら
    if params[:order][:addresses] == "user_address"
       # ユーザーの郵便番号と住所を表示
      @address = current_customer
      # ユーザー以外のアドレスだったら
   else
      @address = Delivery.find(params[:order][:addresses].to_i)
      #ユーザー以外の指定した配送先を保存
    end
    # binding.pry
    @order.post_code = @address.post_code
    @order.prefecture_id = @address.prefecture_id
    @order.municipality = @address.municipality
    @order.address = @address.address

  # @address_id = delivery.id
  # @address = delivery.name + delivery.post_code + delivery.prefecture.name# @order = Order.find(params[:id])

     # 変数名.カラム名= 変数名.カラム名
   #もし注文したユーザーのアドレスがユーザ-以外のアドレスだったら
    #もし注文したユーザーのアドレスがユーザーのアドレスだったら




    if @order.save

     #カートに入っているアイテムをeach文で出す
      current_customer.cartitems.each do |f|
          # 注文詳細
          order_detail = OrderDetail.new
          #注文詳細の注文数 カートに入っている購入希望数を注文数に
          order_detail.order_quantity = f.purchase_quantity
           #注文詳細の税込価格 商品価格
          order_detail.price = f.product.product_price
           #注文詳細の注文id        注文id
          order_detail.order_id = @order.id
          #注文詳細の商品idに商品id
          order_detail.product_id = f.product.id
          # 注文詳細に保存
          order_detail.save
          #カートの中身を削除する
          f.destroy
        end
    # もし配送先住所,支払い方法,合計金額の保存に成功したら購入完了画面に移動
          redirect_to order_purchase_complete_path(@order) and return
    else
       #失敗したら購入画面に戻る
          @customer = current_customer
          render :new

    end
  end



        # @order_detail.save
        #item.destroy （カートのアイテムを削除)

# 購入履歴詳細
  def show
    @order = Order.find(params[:id])
    # @orders = Order.all
  end

#購入後画面
  def purchase_complete
    end

    def update
          @order = Order.find(params[:id])
       if @order.update(order_params)
          flash[:notice] = "登録しました"
          redirect_to admin_orders_path
        else
          render :index
      end
  end

# 購入履歴
  def index

    @orders = current_customer.orders.page(params[:page]).per(PER)
  end

  private
    def order_params
      params.require(:order).permit(:settlement_method,:postage,:delivery_status,:total_amount,:total_price,:addresses,:customer_id,:name,:post_code,:prefecture_id,:municipality,:address,:address)
    end

    def order_detail_params
      params.require(:order_detail).permit(:order_quantity,:price,:order_id,:product_id)
    end
    def ransack
      @q = Product.ransack(params[:q])
    end
    def total_price(cartitems)
      @total_price = 0
      @total_amount = 0

      cartitems.each do |cartitem|
        # 下はコメントアウトのまま

        # (例)@total = @total + cartitem.product.product_price * purchase_quantity
        @total_price +=  cartitem.product.product_price * cartitem.purchase_quantity
        @total_amount += cartitem.purchase_quantity
      end
    end
end