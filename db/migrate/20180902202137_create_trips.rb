class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :seatsno
      t.datetime :dtime

      t.timestamps
    end
  end
end
