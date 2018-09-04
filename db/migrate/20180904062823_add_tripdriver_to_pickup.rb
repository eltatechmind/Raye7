class AddTripdriverToPickup < ActiveRecord::Migration[5.2]
  def change
    add_column :pickups, :trip_driver, :string
  end
end
