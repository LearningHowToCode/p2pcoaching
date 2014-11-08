class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.string   'country'

      t.timestamps
    end
  end
end
