class Course < ApplicationRecord
  has_many :chapters
  belongs_to :subject
  belongs_to :instructor, class_name: 'User'
  has_many :course_registrations, foreign_key: :lesson_id
  has_many :learners, through: :course_registrations
end
