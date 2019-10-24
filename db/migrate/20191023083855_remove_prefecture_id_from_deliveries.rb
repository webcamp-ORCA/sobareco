class RemovePrefectureIdFromDeliveries < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :prefecture_id, :integer
  end
end
