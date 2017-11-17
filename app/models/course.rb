class Course < ApplicationRecord
  has_many :chapters
  belongs_to :subject
  has_many :course_creations
  has_many :instructors, through: :course_creations
  has_many :course_registrations, foreign_key: :lesson_id
  has_many :learners, through: :course_registrations
  validates_presence_of :title
  validates_presence_of :subject_id
  validates_presence_of :about
  def modified_date
   self.updated_at.strftime("%d %b. %Y")
  end
  
  def self.search(query)
    query = query.downcase
    where("lower(title) like ? OR lower(about) like?", "%#{query}%", "%#{query}%")
  end

  def instructor_tokens=(ids)
    self.instructor_ids = ids
  end
end
