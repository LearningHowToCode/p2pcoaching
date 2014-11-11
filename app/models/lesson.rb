class Lesson < ActiveRecord::Base
	belongs_to :student
	belongs_to :tutor

  has_one :order
end
