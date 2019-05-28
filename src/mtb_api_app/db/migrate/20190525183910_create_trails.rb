class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.float :lat
      t.float :lon
      t.integer :light_rain_wait
      t.integer :heavy_rain_wait

      t.timestamps
    end
  end
end