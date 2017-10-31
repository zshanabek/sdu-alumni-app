class AddUserToSkill < ActiveRecord::Migration[5.1]
  def change
    add_reference :user, :skill, foreign_key: true, index: true    
  end
end
