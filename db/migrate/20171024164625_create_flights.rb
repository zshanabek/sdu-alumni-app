class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :departure_city
      t.string :arrival_city
      t.datetime :departure_time
      t.datetime :arraival_time

      t.timestamps
    end
  end
end
