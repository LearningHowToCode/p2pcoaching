class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.date :day
      t.time :start_time
      t.integer :duration
      t.string :status, default: 'available'
      t.integer :tutor_id
      t.integer :student_id

      t.timestamps
    end
  end
end
