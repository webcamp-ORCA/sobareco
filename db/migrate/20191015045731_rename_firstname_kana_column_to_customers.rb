class RenameFirstnameKanaColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :Firstname_kana, :firstname_kana
  end
end
