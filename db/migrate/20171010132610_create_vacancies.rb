class CreateVacancies < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.integer :salary
      t.string :responsibilities
      t.string :demands

      t.timestamps
    end
  end
end
