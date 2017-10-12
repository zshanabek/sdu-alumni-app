class AddMetaColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :admission_date, :date
    add_column :users, :graduation_date, :date
    add_column :users, :specialty_id, :integer
    add_column :users, :industry_id, :integer
    add_column :users, :job_title_id, :integer
    add_column :users, :country_id, :integer
  end
end
