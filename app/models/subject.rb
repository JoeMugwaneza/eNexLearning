class Subject < ApplicationRecord
  has_many :courses
  validates_presence_of :title, :message => 'should be specified'
  validates_presence_of :description, :message => 'should be present'
  def modified_date
   self.updated_at.strftime("%d %b. %Y")
  end

  def self.search(query)
    query = query.downcase
    where("lower(title) like ? OR lower(description) like?", "%#{query}%", "%#{query}%")
  end
end
