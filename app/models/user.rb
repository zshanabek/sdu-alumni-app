# frozen_string_literal: true

class User < ApplicationRecord
  has_many :vacancies
  has_many :flights
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :industries
  acts_as_token_authenticatable
  acts_as_followable
  acts_as_follower
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
