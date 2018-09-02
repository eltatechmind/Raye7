class AddSourceToPickup < ActiveRecord::Migration[5.2]
  def change
    add_column :pickups, :source_id, :integer
    add_index :pickups, :source_id
  end
end
