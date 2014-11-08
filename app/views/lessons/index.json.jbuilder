json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :day, :start_time, :end_time, :status, :tutor_id, :student_id
  json.url lesson_url(lesson, format: :json)
end
