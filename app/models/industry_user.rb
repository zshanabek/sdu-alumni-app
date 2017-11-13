class IndustryUser < ApplicationRecord
    belongs_to :user
    belongs_to :industry

    # scope :by_industry,-> industry {where(:industry_id => industry)}
end
