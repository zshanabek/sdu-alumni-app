class AddSpecialtyToFaculty < ActiveRecord::Migration[5.1]
  def change
    add_reference :specialties, :faculty, foreign_key: true, index: true
  end
end
