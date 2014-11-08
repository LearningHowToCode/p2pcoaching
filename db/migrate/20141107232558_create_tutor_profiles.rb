class CreateTutorProfiles < ActiveRecord::Migration
  def change
    create_table :tutor_profiles do |t|
      t.string :name

      t.timestamps
    end
  end
end
