def review_attrs
  {
    review: 'qwe qw eqwe qwe',
    rating: rand(11) / 2
  }
end

10.times do |i|
  Lesson.all.reject(&:review).sample.create_review review_attrs
  print '.'
end
puts 'Reviews created!'


