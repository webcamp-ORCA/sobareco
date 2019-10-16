class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.integer :id
      t.string :artist_name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
