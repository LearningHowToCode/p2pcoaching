class Review < ActiveRecord::Base
  belongs_to :lesson
  
  validate do |r|
    errors.add(:rating, I18n.t(:rating_should_be_between_1_and_5)) if r.rating < 1 || r.rating > 5
  end

  after_save :update_tutor_rating

  def update_tutor_rating
    if lesson && lesson.tutor
      reviews = lesson.tutor.lessons.reviews
      lesson.tutor.update_column :rating, reviews.sum(&:rating) / reviews.length
    end
  end
end
