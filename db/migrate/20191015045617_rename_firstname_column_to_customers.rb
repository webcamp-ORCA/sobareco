class RenameFirstnameColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :Firstname, :first_name
  end
end
