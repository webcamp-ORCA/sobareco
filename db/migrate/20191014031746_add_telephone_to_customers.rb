class AddTelephoneToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Telephone, :string
  end
end
