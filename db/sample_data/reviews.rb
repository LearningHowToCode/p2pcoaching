def review_attrs
  {
    lesson_id: Lesson.all[0..2].sample.id,
    review: 'qwe qw eqwe qwe',
    rating: rand(11) / 2
  }
end

10.times do |i|
  Review.create review_attrs
  print '.'
end
puts 'Reviews created!'


