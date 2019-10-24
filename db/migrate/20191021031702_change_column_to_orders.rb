class ChangeColumnToOrders < ActiveRecord::Migration[5.2]
  def change
  	 change_column :orders, :postage, :integer, null: false, default: '500'
  end
end
