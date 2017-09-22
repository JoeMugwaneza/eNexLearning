class CreateCourseRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :course_registrations do |t|
      t.integer :learner_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
