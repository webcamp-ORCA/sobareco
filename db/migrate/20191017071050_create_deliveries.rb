class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.string :post_code
      t.text :prefecture
      t.text :municipality
      t.text :address
      t.string :telephone

      t.timestamps
    end
  end
end
