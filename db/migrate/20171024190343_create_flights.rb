class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :departure_city
      t.integer :arrival_city
      t.integer :departure_time
      t.integer :arrival_time
      t.timestamps
    end
  end
end
