class AddColumnsToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :subject_id, :integer
    add_column :courses, :about, :text
    add_column :courses, :instructor_id, :integer
  end
end
