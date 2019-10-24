class ChangeDatatypeSettlementmethod < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :settlement_method, :string
  end
end
