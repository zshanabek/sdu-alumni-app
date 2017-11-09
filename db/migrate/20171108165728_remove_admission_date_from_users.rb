class RemoveAdmissionDateFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admission_date
    remove_column :users, :job_title_id
  end
end
