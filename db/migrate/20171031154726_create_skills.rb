class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name,  null: false
      t.timestamps
    end
  end
end
