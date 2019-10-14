class AddMunicipalityToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Municipality, :text
  end
end
