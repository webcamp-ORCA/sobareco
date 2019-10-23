class RemovePrefectureFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :prefecture, :text
  end
end
