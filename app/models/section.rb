class Section < ApplicationRecord
  belongs_to :chapter
  validates_presence_of :title, :message => "Field required"
  validates_presence_of :content, :message => "must exist"
  validates_presence_of :chapter_id, :message => "must exist"

  def self.search(query)
    query = query.downcase
    where("lower(title) like ? OR lower(content) like?", "%#{query}%", "%#{query}%")
  end
  
  def course
    self.chapter.course
  end
end
