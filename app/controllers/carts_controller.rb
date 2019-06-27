class CartsController < ApplicationController

  before_action :resignation_flag_check?

  def index
  	@user = current_user
    @carts = @user.carts
    # 合計金額の定義
    @price = 0
    @carts.each do |cart|
      @price = @price + (cart.good.price*cart.cart_value)
    end
    #binding.pry

  end

  def create
  	@cart = Cart.new(cart_params)
  	@cart.user_id = current_user.id
    @good = Cart.find_by(good_id: params[:id])
  	if @cart.save
  		redirect_to carts_path
  	else
  	  redirect_to goods_path
  	end

  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to carts_path
    else
      redirect_to carts_path
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  private
  def cart_params
  	 params.require(:cart).permit(:id, :cart_value, :good_id)
  end

end
