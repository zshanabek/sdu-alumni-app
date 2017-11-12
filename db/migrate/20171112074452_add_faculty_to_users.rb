class AddFacultyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :faculty, foreign_key: true, index: true    
  end
end
