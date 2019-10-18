class CreateLabers < ActiveRecord::Migration[5.2]
  def change
    create_table :labers do |t|
    	 t.string "label_name"
      t.timestamps
    end
  end
end
