class AddLastnameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Lastname, :string
  end
end
