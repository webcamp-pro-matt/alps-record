class CartsController < ApplicationController
  def index
  end

  def create
  	@cart = Cart.new(cart_params)
  	if @cart.save
  		redirect_to cart_path(@cart.goods_id)
  	else
  	 render "show"
  	end

  end

  def update
  end

  def destroy
  end

  private
  def cart_params
  	 params.require(:cart).permit(:id, :cart_value, goods_attributes:[:id])
  end

end
