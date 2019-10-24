class RemovePayuserIdFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :payuser_id, :string
  end
end
