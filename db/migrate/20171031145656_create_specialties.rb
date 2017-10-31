class CreateSpecialties < ActiveRecord::Migration[5.1]
  def change
    create_table :specialties do |t|
      t.integer :specialty_name_id
      t.integer :degree

      t.timestamps
    end
  end
end
