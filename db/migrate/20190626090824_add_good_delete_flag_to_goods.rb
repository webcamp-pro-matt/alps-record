class AddGoodDeleteFlagToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :good_delete_flag, :integer
  end
end
