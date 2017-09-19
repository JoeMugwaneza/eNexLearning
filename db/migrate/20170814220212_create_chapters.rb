class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :course_id
      t.string :tags
      t.text :body

      t.timestamps
    end
  end
end
