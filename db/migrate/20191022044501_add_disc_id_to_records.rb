class AddDiscIdToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :disc_id, :integer
  end
end
