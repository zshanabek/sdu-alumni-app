class Industry < ApplicationRecord
    has_many :industry_users
    has_many :users, :through => :industry_users
end
