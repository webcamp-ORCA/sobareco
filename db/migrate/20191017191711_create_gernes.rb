class CreateGernes < ActiveRecord::Migration[5.2]
  def change
    create_table :gernes do |t|
     t.string "gerne_name"
      t.timestamps
    end
  end
end
