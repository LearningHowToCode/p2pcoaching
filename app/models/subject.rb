class Subject < ActiveRecord::Base
  validates_uniqueness_of :name

  has_and_belongs_to_many :tutors

  scope :own, ->{ where(own: true) }
end
