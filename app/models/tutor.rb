class Tutor < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :lessons

  mount_uploader :image, ImageUploader
end
