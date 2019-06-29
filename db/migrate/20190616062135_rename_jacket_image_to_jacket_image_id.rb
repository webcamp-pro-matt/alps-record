class RenameJacketImageToJacketImageId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :goods, :jacket_image, :jacket_image_id
  end
end
