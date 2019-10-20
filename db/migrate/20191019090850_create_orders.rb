class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :settlement_method
		t.datetime :delivery_preferred_date
		t.string :postage
		t.integer :delivery_status
		t.integer :total_amount
		t.string :addresses
		t.integer :customer_id
		t.string :post_code
		t.text :prefectures
		t.text :municipality
		t.text :address
		t.string :telephone


      t.timestamps
    end
  end
end
