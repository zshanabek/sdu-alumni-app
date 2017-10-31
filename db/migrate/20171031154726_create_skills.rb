class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :skill_name  null: false
      t.text :skill_description
      t.timestamps
    end
  end
end
