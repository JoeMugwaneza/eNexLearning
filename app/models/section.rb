class Section < ApplicationRecord
  belongs_to :chapter
  validates_presence_of :title, :message => "Field required"
  validates_presence_of :content, :message => "must exist"
  validates_presence_of :chapter_id, :message => "must exist"
end
