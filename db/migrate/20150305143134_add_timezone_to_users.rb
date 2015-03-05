class AddTimezoneToUsers < ActiveRecord::Migration
  def change
    add_column :students, :timezone, :string
    add_column :tutors, :timezone, :string
  end
end
