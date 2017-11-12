class Faculty < ApplicationRecord
    has_many :specialties
    has_many :users
end
