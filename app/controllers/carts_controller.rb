class CartsController < ApplicationController
  def index
  	@user = current_user
    @carts = @user.carts
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
  	 params.require(:cart).permit(:id, :cart_value, :good_id)
  end

end
