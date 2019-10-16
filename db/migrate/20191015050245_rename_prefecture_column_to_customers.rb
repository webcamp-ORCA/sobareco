class RenamePrefectureColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :Prefecture, :prefecture
  end
end
