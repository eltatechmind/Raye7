class AddSourceToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :source_id, :integer
    add_index :trips, :source_id
  end
end
