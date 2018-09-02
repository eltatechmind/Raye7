class AddDestinationToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :destination_id, :integer
    add_index :trips, :destination_id
  end
end
