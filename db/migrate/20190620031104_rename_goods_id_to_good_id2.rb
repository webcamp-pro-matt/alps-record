class RenameGoodsIdToGoodId2 < ActiveRecord::Migration[5.2]
  def change
  	 rename_column :carts, :goods_id, :good_id
  end
end
