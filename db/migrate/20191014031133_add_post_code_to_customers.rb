class AddPostCodeToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :PostCode, :string
  end
end
