class CreateArrivalManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :arrival_managements do |t|

      t.timestamps
      t.string :arrival_date
      t.integer :arrival_count
      t.integer :product
    end
  end
end
