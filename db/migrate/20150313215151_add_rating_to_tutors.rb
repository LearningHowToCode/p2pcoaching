class AddRatingToTutors < ActiveRecord::Migration
  def change
    add_column    :tutors,  :rating, :decimal
    change_column :reviews, :rating, :decimal
  end
end
