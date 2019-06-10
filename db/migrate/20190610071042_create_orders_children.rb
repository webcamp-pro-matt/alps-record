class CreateOrdersChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_children do |t|

      t.timestamps
    end
  end
end
