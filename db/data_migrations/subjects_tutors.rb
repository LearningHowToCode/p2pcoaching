puts 'Create own subjects'
Tutor::SUBJECTS.each do |subject|
  Subject.create name: subject, own: true
  print '.'
end

puts 'Create current subjects'
Tutor.pluck(:subject).join(', ').split(',').map(&:strip).uniq.each do |subject|
  Subject.create name: subject unless Tutor::SUBJECTS.include?(subject)
  print '.'
end
puts 'created!'

puts 'Set tutors subjects set in join table'
Tutor.all.each do |t|
  t.subjects = Subject.where{ name.in t.subject.try(:split, ', ') }
  t.save
  print '.'
end
puts 'done!'
