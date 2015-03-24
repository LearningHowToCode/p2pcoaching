class AddOwnToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :own, :boolean, default: false
  end
end
