class AddUserToPickups < ActiveRecord::Migration[5.2]
  def change
    add_column :pickups, :user_id, :integer
    add_index :pickups, :user_id
  end
end
