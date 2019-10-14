class AddPrefecturesToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Prefectures, :text
  end
end
