class Review < ActiveRecord::Base
  belongs_to :lesson
  
  after_save :update_tutor_rating

  def update_tutor_rating
    reviews = lesson.tutor.lessons.reviews
    lesson.tutor.update_column :rating, reviews.sum(&:rating) / reviews.length
  end
end
