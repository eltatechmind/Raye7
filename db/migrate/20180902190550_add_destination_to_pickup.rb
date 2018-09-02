class AddDestinationToPickup < ActiveRecord::Migration[5.2]
  def change
    add_column :pickups, :destination_id, :integer
    add_index :pickups, :destination_id
  end
end
