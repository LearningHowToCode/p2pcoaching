class Order < ActiveRecord::Base
  belongs_to :seller, class_name: 'Tutor'
  belongs_to :buyer, class_name: 'Student'
  belongs_to :lesson
end
