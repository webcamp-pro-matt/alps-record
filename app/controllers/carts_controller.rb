class CartsController < ApplicationController
  def index
  	@carts = Cart.where(user_id: current_user.id)
  	@good = Good.all
  end

  def create
  	@cart = Cart.new(cart_params)
  	@cart.user_id = current_user.id
  	if @cart.save
  		redirect_to carts_path
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
  	 params.require(:cart).permit(:id, :cart_value, :goods_id)
  end

end
