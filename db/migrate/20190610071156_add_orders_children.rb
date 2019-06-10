class AddOrdersChildren < ActiveRecord::Migration[5.2]
  def change
	add_column :orders_children, :goods_id, :integer
	add_column :orders_children, :order_value, :integer
	add_column :orders_children, :order_id, :integer
  end
end
