class AddDetailsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :payuser_id, :string
    add_column :customers, :card_id, :string
  end
end
