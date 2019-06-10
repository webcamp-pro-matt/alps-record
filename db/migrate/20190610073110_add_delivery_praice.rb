class AddDeliveryPraice < ActiveRecord::Migration[5.2]
  def change
  	add_column :delivery_prices, :delivery_price, :integer
  	add_column :delivery_prices, :delivery_start_day, :datetime
  	add_column :delivery_prices, :delivery_finish_day, :datetime
  end
end
