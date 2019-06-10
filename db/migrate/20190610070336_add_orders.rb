class AddOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :users_id, :integer
  	add_column :orders, :other_address, :string
  	add_column :orders, :payment_method, :integer
  	add_column :orders, :delivery, :string
  	add_column :orders, :other_name, :string
  	add_column :orders, :other_kana, :string
  	add_column :orders, :other_post_code, :string
  end
end
