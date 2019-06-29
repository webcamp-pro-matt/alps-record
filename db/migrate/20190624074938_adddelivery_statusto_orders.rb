class AdddeliveryStatustoOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :delivery_status, :integer
  end
end
