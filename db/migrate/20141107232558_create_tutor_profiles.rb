class CreateTutorProfiles < ActiveRecord::Migration
  def change
    create_table :tutor_profiles do |t|
      t.string :format
      t.string :university
      t.decimal :price
      t.string :profile

      t.timestamps
    end
  end
end