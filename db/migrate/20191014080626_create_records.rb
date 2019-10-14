class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :song_title
      t.integer :disc_number
      t.integer :music_order
      t.timestamps
    end
  end
end
