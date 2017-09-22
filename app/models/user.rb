class User < ApplicationRecord
  has_many :courses, foreign_key: :instructor_id
  has_many :course_registrations, foreign_key: :learner_id
  has_many :lessons, through: :course_registrations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
