def lesson_attrs
  {
    tutor_id: Tutor.all[0..2].sample.id,
    student_id: Student.all[0..2].sample.id,
    day: (rand(10) - 5).days.from_now,
    start_time: (rand(10) - 5).hours.from_now,
    duration: [15, 30, 45, 60].sample
  }
end

10.times do |i|
  Lesson.create lesson_attrs
  print '.'
end
puts 'Lessons created!'

