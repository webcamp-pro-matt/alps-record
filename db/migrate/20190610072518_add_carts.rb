class AddCarts < ActiveRecord::Migration[5.2]
  def change
  	add_column :carts, :goods_id, :integer
  	add_column :carts, :cart_value, :integer
	add_column :carts, :user_id, :integer
  end
end
