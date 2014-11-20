class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :format
      t.decimal :price
      t.text :bio

      t.timestamps
    end
  end
end
