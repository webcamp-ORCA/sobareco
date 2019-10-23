class AddProductIdToDiscs < ActiveRecord::Migration[5.2]
  def change
    add_column :discs, :product_id, :integer
  end
end
