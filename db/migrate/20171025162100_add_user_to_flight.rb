class AddUserToFlight < ActiveRecord::Migration[5.1]
  def change
    add_reference :flights, :user, foreign_key: true, index: true
  end
end
