class AddFirstnameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Firstname, :string
  end
end
