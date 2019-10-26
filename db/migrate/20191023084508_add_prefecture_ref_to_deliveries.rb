class AddPrefectureRefToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_reference :deliveries, :prefecture, foreign_key: true
  end
end
