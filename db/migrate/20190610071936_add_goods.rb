class AddGoods < ActiveRecord::Migration[5.2]
  def change
  	add_column :goods, :artist, :string
  	add_column :goods, :goods_title, :string
	add_column :goods, :album_flag, :integer
	add_column :goods, :jacket_image, :string
	add_column :goods, :type, :string
	add_column :goods, :rabel, :string
	add_column :goods, :price, :integer
	add_column :goods, :stock, :integer
	add_column :goods, :goods_status, :string
  end
end
