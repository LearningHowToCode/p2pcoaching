class Student < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :lessons

  has_many :purchases, class_name: 'Order', foreign_key: 'buyer_id'
end
