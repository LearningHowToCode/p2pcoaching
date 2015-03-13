# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def tutor_attrs
  {
    "name" => "qwe",
    "format" => nil,
    "price" =>  rand(100) + 15,
    "bio" => "sdcdwcwvv",
    "image" => nil,
    "undergraduate_institution" => "Cornell",
    "undergraduate_major" => "qwe",
    "graduate_institution" => "UPenn",
    "graduate_study_field" => "",
    "subject" => Tutor::SUBJECTS.sample(5).join(', '),
    "long_bio" => "d saf da fasf",
    "skype_id" => "fdafdsf",
    "gmail_address" => "sdfsf@fads.dsa",
    "languages" => "English",
    "completed_profile" => true,
    "routing_number" => nil,
    "account_number" => nil,
    "paypal_account" => "",
    "timezone" =>  ActiveSupport::TimeZone.all.sample.name
  }
end

10.times do |i|
  Tutor.create tutor_attrs
  print '.'
end
puts 'Tutors created!'

require_relative 'sample_data/students'
require_relative 'sample_data/admin'
require_relative 'sample_data/lessons'
require_relative 'sample_data/reviews'
