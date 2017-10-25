class AddCreatorToFlight < ActiveRecord::Migration[5.1]
  def change
    add_reference :flights, :user, foreign_key: true
  end
end
