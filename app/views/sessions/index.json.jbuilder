json.array!(@sessions) do |session|
  json.extract! session, :id, :day, :start_time, :end_time, :status, :tutor_id, :student_id
  json.url session_url(session, format: :json)
end
