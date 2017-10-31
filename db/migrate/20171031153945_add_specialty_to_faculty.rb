class AddSpecialtyToFaculty < ActiveRecord::Migration[5.1]
  def change
    add_reference :specialty, :faculty, foreign_key: true, index: true
  end
end
