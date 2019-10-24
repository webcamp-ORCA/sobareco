class RenamePostageColumnToOrders < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders, :postage, :postage
  end
end
