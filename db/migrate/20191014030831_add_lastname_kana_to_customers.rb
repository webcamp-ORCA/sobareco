class AddLastnameKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Lastname_kana, :string
  end
end
