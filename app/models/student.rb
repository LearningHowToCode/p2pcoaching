class Student < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :lesssons

end
