class RenameAddressColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :Address, :address
  end
end
