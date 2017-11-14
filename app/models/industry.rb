class Industry < ApplicationRecord
    has_many :industry_users, dependent: :delete_all
    has_many :users, :through => :industry_users
    
end
