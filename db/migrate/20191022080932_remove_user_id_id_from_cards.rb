class RemoveUserIdIdFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :user_id_id, :integer
  end
end
