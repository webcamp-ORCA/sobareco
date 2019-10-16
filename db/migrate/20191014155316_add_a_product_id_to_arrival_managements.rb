class AddAProductIdToArrivalManagements < ActiveRecord::Migration[5.2]
  def change
    add_column :arrival_managements, :product_id, :integer
  end
end
