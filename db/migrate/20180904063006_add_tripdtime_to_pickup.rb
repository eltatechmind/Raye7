class AddTripdtimeToPickup < ActiveRecord::Migration[5.2]
  def change
    add_column :pickups, :trip_dtime, :datetime
  end
end
