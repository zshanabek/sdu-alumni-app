# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_token_authenticatable

  has_friendship
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vacancies, dependent: :destroy
  has_many :flights, dependent: :destroy
  belongs_to :faculty
  belongs_to :specialty  
  has_and_belongs_to_many :skills
  has_many :industry_users
  has_many :industries, :through => :industry_users do
    def by_industry
      industry { where("industry_users.by_industry = ?", industry)}
    end
  end

  scope :featured, -> { where(:featured => true) }
  scope :by_degree, -> degree { where(:specialty_id => degree) }
  scope :by_industry, -> industry { where(:industry_id => industry) }  
  scope :by_period, -> started_at, ended_at { where("graduation_date >= ? AND graduation_date <= ?", started_at, ended_at) }
end
