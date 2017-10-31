class AddSkillToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :skill, :user, foreign_key: true, index: true
  end
end
