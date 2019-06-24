class RenameGoodsIdcolumnToOrderschildren < ActiveRecord::Migration[5.2]
  def change
  	  rename_column :orders_children, :goods_id, :good_id
  end
end
