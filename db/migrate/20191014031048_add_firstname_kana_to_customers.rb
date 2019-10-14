class AddFirstnameKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Firstname_kana, :string
  end
end
