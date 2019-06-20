class AdddeliverySelectFlagToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :delivery_select_flag, :integer

  end
end
