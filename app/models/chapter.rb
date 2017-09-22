class Chapter < ApplicationRecord
  belongs_to :course
  has_many :sections
  validates_presence_of :title, :message => "Field required"
  validates_presence_of :body, :message => "Field required"
end
