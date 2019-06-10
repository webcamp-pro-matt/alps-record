class CreateUsersChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :users_children do |t|

      t.timestamps
    end
  end
end
