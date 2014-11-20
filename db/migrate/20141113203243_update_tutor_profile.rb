class UpdateTutorProfile < ActiveRecord::Migration
  def change
    add_column :tutors, :undergraduate_institution, :string
    add_column :tutors, :undergraduate_major, :string
    add_column :tutors, :graduate_institution, :string
    add_column :tutors, :graduate_study_field, :string
    add_column :tutors, :subject, :text, array: true
    add_column :tutors, :long_bio, :text
  end
end
