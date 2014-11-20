class AddCompletedProfileToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :completed_profile, :boolean, default: false
  end
end
