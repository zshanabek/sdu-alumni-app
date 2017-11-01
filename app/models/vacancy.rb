# frozen_string_literal: true

class Vacancy < ApplicationRecord
    include PublicActivity::Model
    belongs_to :user
    tracked 
end
