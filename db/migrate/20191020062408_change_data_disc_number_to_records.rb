class ChangeDataDiscNumberToRecords < ActiveRecord::Migration[5.2]
  def change
    change_column :records, :disc_number, :string
  end
end
