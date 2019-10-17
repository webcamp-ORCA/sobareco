class AddProductIdToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :product_id, :integer
  end
end
