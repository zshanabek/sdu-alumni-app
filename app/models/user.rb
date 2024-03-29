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
  has_many :industry_users,dependent: :delete_all 
  has_many :industries, :through => :industry_users  

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png" 
  # validates_attachment :avatar, presence: true, :size => { :in => 0..10.kilobytes }
  do_not_validate_attachment_file_type :avatar

  scope :by_industry, -> industries {
    User.joins(:industry_users).where(industry_users: { 
      id: IndustryUser.where(industry: Industry.where(id: industries))
    })
  }  
  scope :by_specialty, -> specialty { where(:specialty_id => specialty) }
  scope :by_faculty, -> faculty { where(:faculty_id => faculty) }  
  scope :by_period, -> started_at, ended_at { where("graduation_date >= ? AND graduation_date <= ?", started_at, ended_at) }
end
