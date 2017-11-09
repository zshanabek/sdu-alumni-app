# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_token_authenticatable

  has_friendship
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vacancies, dependent: :destroy
  has_many :flights, dependent: :destroy
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :industries
  
end
