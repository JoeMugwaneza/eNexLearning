class Chapter < ApplicationRecord
  belongs_to :course
  has_many :sections
  validates_presence_of :title, :message => "Field required"
  validates_presence_of :body, :message => "Field required"
  def self.search(query)
    query = query.downcase
    where("lower(title) like ? OR lower(body) like? OR lower(tags) like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end
end
