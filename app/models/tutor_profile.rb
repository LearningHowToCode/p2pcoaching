class TutorProfile < ActiveRecord::Base
  has_one :user, as: :profile

  delegate :name, to: :user
end
