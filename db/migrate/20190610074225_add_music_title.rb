class AddMusicTitle < ActiveRecord::Migration[5.2]
  def change
  	add_column :music_titles, :goods_id, :integer
  	add_column :music_titles, :song, :string
  	add_column :music_titles, :song_number, :integer
  	add_column :music_titles, :disc_number, :integer
  end
end
