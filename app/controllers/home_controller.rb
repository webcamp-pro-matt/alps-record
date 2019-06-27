class HomeController < ApplicationController

  before_action :resignation_flag_check?, only:[:done]

  def top
  end

  def finish
  	# buy_flagが立っていないorderを検索	  
	@order = Order.find_by(user_id: current_user.id, buy_flag: nil)
	# buy_flagに1を立てる。
	@order.buy_flag = 1
	@order.save

  	# 2.OrdersChildrenにCartの内容を与える
	@cart = Cart.where(user_id: current_user.id)

	# カートの数だけOrdersChildを作成する。
	@cart.each do |cart|
		orders_child = OrdersChild.new
		orders_child.good_id = cart.good_id
		orders_child.order_value = cart.cart_value
		orders_child.order_id = @order.id
		orders_child.save
	end
	

  	# 3.Cartを消す
  	@cart.destroy_all


  	redirect_to home_done_path

  end

  def done
    
  end

  private
	  def orders_child_params
	  	 params.require(:order).permit(orders_child_attributes:[:id, :order_value, :good_id, :order_id])
	  end

end
