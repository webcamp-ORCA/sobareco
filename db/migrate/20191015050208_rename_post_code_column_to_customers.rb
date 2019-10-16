class RenamePostCodeColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :PostCode, :post_code
  end
end
