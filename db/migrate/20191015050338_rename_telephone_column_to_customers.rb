class RenameTelephoneColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :Telephone, :telephone
  end
end
