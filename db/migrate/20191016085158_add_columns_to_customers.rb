class AddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :prefecture_code, :integer
  end
end
