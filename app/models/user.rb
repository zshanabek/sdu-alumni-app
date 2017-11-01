# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable  
  # has_secure_password
  has_many :vacancies
  has_many :flights
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
