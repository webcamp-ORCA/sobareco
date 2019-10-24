class AddPrefectureRefToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :prefecture, foreign_key: true
  end
end
