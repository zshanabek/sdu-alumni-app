class AddCreatorToVacancy < ActiveRecord::Migration[5.1]
  def change
    add_reference :vacancies, :user, foreign_key: true, index: true
  end
end
