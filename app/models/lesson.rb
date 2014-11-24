class Lesson < ActiveRecord::Base
	belongs_to :student
	belongs_to :tutor
  has_one :order

  validates :duration, numericality: true

  def price
    (self.tutor.price * self.duration) / 60
  end

  def reserved?
    self.status == 'reserved'
  end

  # November 25th, 4:00-5:00pm
  def date_and_time
    end_time = self.start_time + 30.minutes
    self.day.strftime("%B %d, ") + self.start_time.strftime('%H:%M-') +
        end_time.strftime('%H:%M')
  end
end
