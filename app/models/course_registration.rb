class CourseRegistration < ApplicationRecord
  belongs_to :lesson, class_name: 'Course'
  belongs_to :learner, class_name: 'User'
end
