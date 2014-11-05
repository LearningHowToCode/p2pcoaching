class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :format
      t.string :university
      t.decimal :price
      t.string :profile

      t.timestamps
    end
  end
end
