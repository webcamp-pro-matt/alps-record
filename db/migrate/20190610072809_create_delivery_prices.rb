class CreateDeliveryPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_prices do |t|

      t.timestamps
    end
  end
end
