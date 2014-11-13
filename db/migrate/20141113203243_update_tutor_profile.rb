class UpdateTutorProfile < ActiveRecord::Migration
  def change
    add_column :tutors, :undergraduate_institution, :string
    add_column :tutors, :undergraduate_major, :string
    add_column :tutors, :graduate_institution, :string
    add_column :tutors, :graduate_study_field, :string
    add_column :tutors, :subject, :string
    add_column :tutors, :long_bio, :text
    remove_column :tutors, :university
  end
end
