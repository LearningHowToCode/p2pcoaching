class Tutor < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :lessons, dependent: :destroy
  has_many :sales, class_name: "Order", foreign_key: "seller_id"

  mount_uploader :image, ImageUploader
end
