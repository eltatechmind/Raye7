class AddTripidToPickup < ActiveRecord::Migration[5.2]
  def change
    add_column :pickups, :trip_id, :integer
  end
end
