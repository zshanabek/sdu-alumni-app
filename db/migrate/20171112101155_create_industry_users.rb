class CreateIndustryUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :industry_users, id: false do |t|
      t.belongs_to :industry, index: true
      t.belongs_to :user, index: true
    end
  end
end
