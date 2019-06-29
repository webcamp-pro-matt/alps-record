class RenameUsersIdcolumnToOrder < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders, :users_id, :user_id
  end
end
