class UpdateLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :duration, :integer
    remove_column :lessons, :end_time
    change_column :lessons, :start_time, :time
  end
end
