Tutor.all.each do |t|
  t.subjects = Subject.where{ name.in t.subject.try(:split, ', ') }
  t.save
  print '.'
end
puts 'Tutors subjects set in join table!'
