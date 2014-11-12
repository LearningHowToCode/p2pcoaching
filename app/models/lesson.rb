class Lesson < ActiveRecord::Base
	belongs_to :student
	belongs_to :tutor

  has_one :order

  validates :duration, numericality: true

  def price
    (self.tutor.price * self.duration) / 60
  end
end
