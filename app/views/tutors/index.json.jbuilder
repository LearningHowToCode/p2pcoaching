json.array!(@tutors) do |tutor|
  json.extract! tutor, :id, :name, :format, :university, :price, :bio
  json.url tutor_url(tutor, format: :json)
end
