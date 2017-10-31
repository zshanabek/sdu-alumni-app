class Specialty < ApplicationRecord
    include PublicActivity::Model
    belongs_to :faculty
end
