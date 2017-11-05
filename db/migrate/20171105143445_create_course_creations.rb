class CreateCourseCreations < ActiveRecord::Migration[5.1]
  def change
    create_table :course_creations do |t|
      t.integer :instructor_id
      t.integer :course_id

      t.timestamps
    end
  end
end
