class AddReviewFieldsToLessons < ActiveRecord::Migration
  def change
    change_table :lessons do |t|
      t.boolean  :reminded
      t.datetime :end_time
    end
  end
end
