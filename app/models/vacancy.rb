# frozen_string_literal: true

class Vacancy < ApplicationRecord
    include PublicActivity::Model
    tracked only: [:create], owner: Proc.new{ |controller, model| controller.current_user }
    belongs_to :user
end
