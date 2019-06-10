class AddChildren < ActiveRecord::Migration[5.2]
  def change
  	add_column :users_children, :name_kanji_sei, :string
  	add_column :users_children, :name_kanji_mei, :string
  	add_column :users_children, :name_kana_sei, :string
  	add_column :users_children, :name_kana_mei, :string
  	add_column :users_children, :post_code, :string
  	add_column :users_children, :address, :string
  	add_column :users_children, :user_id, :integer
  end
end
