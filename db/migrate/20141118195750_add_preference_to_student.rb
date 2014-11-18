class AddPreferenceToStudent < ActiveRecord::Migration
  def change
    add_column :students, :preference, :string
  end
end
