class AddCustomerIdToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :customer_id, :integer
  end
end
