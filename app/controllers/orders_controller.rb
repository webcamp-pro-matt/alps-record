class OrdersController < ApplicationController

  before_action :resignation_flag_check?

  before_action :admin_flag_check?, only: [:admin_update, :admin_edit]
  def index
    @order = Order.new
    @user = current_user
    @user_children = UsersChild.where(user_id: @user.id)
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id

    if @order.delivery_select_flag == 0
      @order.save
      redirect_to order_path(@order.user_id)
    else

      @order.save
      #binding.pry
      redirect_to order_path(@order.id)
    end
    #binding.pry

  end

  def show
    @user = current_user
    @carts = @user.carts
    @orders = Order.find_by(user_id: @user.id)
    @delivery_price = DeliveryPrice.find(1).delivery_price



    # 
    # 現在時刻の取得ロジック 始まり
    #

    # 現在時刻の取得
    time_now = DateTime.now
    # 現在時刻を日本時刻に変換
    time_now_tokyo = time_now.in_time_zone('Tokyo')
    # 送料テーブルを一旦全部持ってくる
    delivery_price_all = DeliveryPrice.all

    # # 送料テーブルをeach文で回す
    target_delivery_price = 0
    # 下記メゾットを動かすためには、以下の手順を実装する。
    # 1.delivery_start_day、delivery_finish_dayにとりあえず、created_atの値を代入
    # 2.delivery_price.delivery_finish_day = delivery_price.delivery_finish_day + 100000000
    #  とか書いてみる +10000000秒加算されるはず
    # 3.saveする。
    delivery_price_all.each do |delivery_price|

      # 現在時刻が、送料適用開始日を過ぎているか
      if time_now_tokyo > delivery_price.delivery_start_day.in_time_zone('Tokyo')
        # 現在時刻が、送料適用終了日を過ぎていないか
        if time_now_tokyo < delivery_price.delivery_finish_day.in_time_zone('Tokyo')
          target_delivery_price = delivery_price.delivery_price
        else
          # 処理しません
        end
      else
        # 処理しません
      end

    end
    # binding.pry
    #
    # 現在時刻の取得ロジック 終わり
    #

    # 
    # 消費税の取得ロジック 始まり
    #

    # 消費税テーブルを一旦全部持ってくる
    tax_all = Tax.all

    # # 送料テーブルをeach文で回す
    target_tax = 0

    tax_all.each do |tax|

      # 現在時刻が、消費税適用開始日を過ぎているか
      if time_now_tokyo > tax.tax_start_day.in_time_zone('Tokyo')
        # 現在時刻が、送料適用終了日を過ぎていないか
        if time_now_tokyo < tax.tax_finish_day.in_time_zone('Tokyo')
          target_tax = tax.tax
        else
          # 処理しません
        end
      else
        # 処理しません
      end

    end
    #
    # 消費税の取得ロジック 終わり
    #



    # 小計金額の定義
    @price = 0
    @carts.each do |cart|
      @price = @price + (cart.good.price*cart.cart_value)
    end

    # 消費税の定義
    @tax = (@price + target_delivery_price) * target_tax - (@price + target_delivery_price)

    # 総計金額の定義
    @total_price = @price + target_delivery_price + @tax
    #binding.pry

    # delivery_select_flagの値により、表示する住所を変える
    # delivery_select_flag == 0 :手入力
    # delivery_select_flag == 1 :登録住所から
    if @orders.delivery_select_flag == 0
      @post_code = @orders.other_post_code
      @address = @orders.other_address
    else
      @post_code = @user.users_children[0].post_code
      @address = @user.users_children[0].address
    end

  end

  def destroy
    @order = Order.find(params[:id])
   
    @carts = Cart.where(user_id: current_user.id)
    @carts.destroy_all
    @order.destroy
    redirect_to goods_path
  end

  def new
  end

  def admin_edit
    @order = Order.find(params[:id])
  end

  def admin_update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_users_path
  end

  private

  def order_params
     params.require(:order).permit(:id, :delivery_status, :other_address, :payment_method, :other_name, :other_kana, :other_post_code, :delivery_select_flag, users_child_attributes: [:post_code, :address])
  end

end
