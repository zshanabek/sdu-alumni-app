class RemoveAdmissionDateFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admission_date
    remove_column :users, :job_title_id
    add_reference    :users, :industry, foreign_key: true, index: true
  end
end
