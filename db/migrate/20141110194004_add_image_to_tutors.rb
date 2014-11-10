class AddImageToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :image, :string
  end
end
