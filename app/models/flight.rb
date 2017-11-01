class Flight < ApplicationRecord
    include PublicActivity::Model
    tracked     
    belongs_to :user
end
