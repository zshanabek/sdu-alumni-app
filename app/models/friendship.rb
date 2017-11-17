class Friendship < ApplicationRecord
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }     
end