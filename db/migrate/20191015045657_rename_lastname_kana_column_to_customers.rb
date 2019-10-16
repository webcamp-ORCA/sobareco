class RenameLastnameKanaColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :Lastname_kana, :lastname_kana
  end
end
