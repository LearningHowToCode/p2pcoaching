class AddDefaultToLessonsReminded < ActiveRecord::Migration
  def change
    change_column :lessons, :reminded, :boolean, default: false
  end
end
