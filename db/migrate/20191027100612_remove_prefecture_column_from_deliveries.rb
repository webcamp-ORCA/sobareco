class RemovePrefectureColumnFromDeliveries < ActiveRecord::Migration[5.2]
  def change
  	remove_column :deliveries, :prefecture, :text
  end
end
