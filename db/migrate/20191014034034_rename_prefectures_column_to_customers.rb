class RenamePrefecturesColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :Prefectures, :Prefecture
  end
end
