class OrdersController < ApplicationController
  def index
    @order = Order.new
    @user = current_user
    @user_children = UsersChild.where(user_id: @user.id)
  end

  def create
    @order = Order.new(order_params)
    @order.users_id = current_user.id
    #binding.pry
    @order.save
    redirect_to order_path(@order.id)
  end

  def show
    @user = current_user
    @carts = @user.carts
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
  end

  def destroy
  end

  def new
  end

  def admin_edit
  end

  def admin_update
  end

  private

  def order_params
     params.require(:order).permit(:id, :other_address, :payment_method, :other_name, :other_kana, :other_post_code, :delivery_select_flag)
  end

end
