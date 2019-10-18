class CreateCartitems < ActiveRecord::Migration[5.2]
  def change
    create_table :cartitems do |t|
      t.integer :purchase_quantity
      t.integer :customer_id
      t.integer :product_id

      t.timestamps
    end
  end
end
