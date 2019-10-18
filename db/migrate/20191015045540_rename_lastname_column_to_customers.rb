class RenameLastnameColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :Lastname, :last_name
  end
end
