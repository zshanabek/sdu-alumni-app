class Flight < ApplicationRecord
    include PublicActivity::Model
    tracked only: [:create], owner: Proc.new{ |controller, model| controller.current_user }
    belongs_to :user
end
