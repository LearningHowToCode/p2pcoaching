class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text    :review
      t.integer :rating
      t.integer :lesson_id

      t.timestamps
    end
  end
end
