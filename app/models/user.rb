# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable  
  # has_secure_password
  has_many :vacancies, dependent: :destroy
  has_many :flights, dependent: :destroy
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :industries
  # acts_as_token_authenticatable
  acts_as_followable
  acts_as_follower

  alias_method :authenticate, :valid_password?

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
end
