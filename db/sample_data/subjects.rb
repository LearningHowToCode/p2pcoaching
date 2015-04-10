Tutor::INDUSTRIES.each do |s|
  Subject.create name: s
  print '.'
end
puts 'Subjects created!'
