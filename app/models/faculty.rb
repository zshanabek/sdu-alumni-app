class Faculty < ApplicationRecord
    include PublicActivity::Model
    has_many :specialty
end
