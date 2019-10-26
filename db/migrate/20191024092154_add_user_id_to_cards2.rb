class AddUserIdToCards2 < ActiveRecord::Migration[5.2]
  def change
  	add_reference :cards, :user, foreign_key: { to_table: :customers }
  end
end
