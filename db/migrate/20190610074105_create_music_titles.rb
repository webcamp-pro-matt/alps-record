class CreateMusicTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :music_titles do |t|

      t.timestamps
    end
  end
end
