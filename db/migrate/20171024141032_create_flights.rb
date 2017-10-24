class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :departure_city_id
      t.string :arrival_city_id
      t.datetime :departure_time
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
