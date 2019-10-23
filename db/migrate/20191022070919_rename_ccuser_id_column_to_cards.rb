class RenameCcuserIdColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :ccuser_id, :customer_id
  end
end
