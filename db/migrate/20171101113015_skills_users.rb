class SkillsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :skills_users, id: false do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :user, index: true
    end
  end
end
