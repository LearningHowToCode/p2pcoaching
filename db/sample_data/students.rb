def student_attrs
  {
    "name" => "asd"
  }
end

10.times do |i|
  Student.create student_attrs
  print '.'
end
puts 'Students created!'


