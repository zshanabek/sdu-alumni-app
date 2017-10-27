class Flight < ApplicationRecord
    include PublicActivity::Model
    belongs_to :user
end
