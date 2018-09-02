class CreatePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :pickups do |t|
      t.datetime :dtime

      t.timestamps
    end
  end
end
