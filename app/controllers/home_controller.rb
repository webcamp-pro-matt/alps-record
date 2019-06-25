class HomeController < ApplicationController
  def top
  end

  def done
  	# 1.Ordersテーブルの buy_flagを1にする
  	
  	@order = Order.find_by(user_id: current_user.id)
  	@order.buy_flag = 1
  	@order.save

  	# 2.OrdersChildrenにCartの内容を与える
  	@orders_children = OrdersChild.new
  	@cart = Cart.find_by(user_id: current_user.id)
  	#binding.pry
  	@orders_children.good_id = @cart.good_id
  	@orders_children.order_value = @cart.cart_value
  	@orders_children.order_id = @order.id
  	@orders_children.save

  	# 3.Cartを消す
  	@cart.destroy


  	render "/home/done"
  	#binding.pry

  end

  private
	  def orders_child_params
	  	 params.require(:order).permit(orders_child_attributes:[:id, :order_value, :good_id, :order_id])
	  end

end
