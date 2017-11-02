# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_followable
  acts_as_follower
  has_many :vacancies, dependent: :destroy
  has_many :flights, dependent: :destroy
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :industries
  
end
