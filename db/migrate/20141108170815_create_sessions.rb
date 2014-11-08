class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :day
      t.string :start_time
      t.string :end_time
      t.string :status
      t.integer :tutor_id
      t.integer :student_id

      t.timestamps
    end
  end
end
