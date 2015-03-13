class Lesson < ActiveRecord::Base
	belongs_to :student
	belongs_to :tutor
  has_one :order
  has_one :review

  validates :duration, numericality: true

  before_save :set_end_time
  scope :to_remind, ->{ where{(end_time < Time.now) & (reminded == false)} }

  def self.remind_reviews
    to_remind.each &:remind_review
  end

  def remind_review
    NotificationMailer.remind_review(self).deliver
    update_column :reminded, true
  end

  def price
    (self.tutor.price * self.duration) / 60
  end

  def reserved?
    self.status == 'reserved'
  end

  def available?
    self.status == 'available'
  end

  # November 25th, 4:00-5:00pm
  def date_and_time
    end_time = self.start_time + self.duration.minutes
    self.day.strftime("%B %d, ") + self.start_time.strftime('%H:%M-') +
        end_time.strftime('%H:%M')
  end

  def set_end_time
    hours = start_time.hour.hours
    mins  = start_time.min.minutes

    self.end_time = day + hours + mins + duration.minutes
  end
end
