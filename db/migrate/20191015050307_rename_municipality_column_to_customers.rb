class RenameMunicipalityColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :Municipality, :municipality
  end
end
