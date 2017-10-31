class Skill < ApplicationRecord
    include PublicActivity::Model
    has_many :users
end
