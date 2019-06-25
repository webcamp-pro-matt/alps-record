class OrdersController < ApplicationController

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
      redirect_to order_path(@order.users_id)
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
    # 小計金額の定義
    @price = 0
    @carts.each do |cart|
      @price = @price + (cart.good.price*cart.cart_value)
    end

    # 消費税の定義
    @tax = (@price + @delivery_price) * Tax.find(1).tax - (@price + @delivery_price)

    # 総計金額の定義
    @total_price = @price + @delivery_price + @tax
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
