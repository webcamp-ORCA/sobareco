class AddPrefectureRefToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_reference :orders, :prefecture, foreign_key: true
  end
end
