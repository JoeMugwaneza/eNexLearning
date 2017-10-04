class User < ApplicationRecord
  attr_accessor :login
  has_many :courses, foreign_key: :instructor_id
  has_many :course_registrations, foreign_key: :learner_id
  has_many :lessons, through: :course_registrations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def self.find_for_database_authentication warden_conditions
  conditions = warden_conditions.dup
  login = conditions.delete(:login)
  where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end
end
