class RemoveProductFromArrivalManagements < ActiveRecord::Migration[5.2]
  def change
    remove_column :arrival_managements, :product, :integer
  end
end
