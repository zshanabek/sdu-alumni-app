class AddIndustryIdsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :industry_ids, :string, array: true, default: []    
  end
end
