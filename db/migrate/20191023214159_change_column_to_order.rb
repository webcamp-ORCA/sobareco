class ChangeColumnToOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :delivery_status , :integer, default: '1'

  end
end
