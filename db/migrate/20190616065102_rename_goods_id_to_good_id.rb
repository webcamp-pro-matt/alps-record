class RenameGoodsIdToGoodId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :music_titles, :goods_id, :good_id
  end
end
