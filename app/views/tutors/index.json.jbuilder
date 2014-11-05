json.array!(@tutors) do |tutor|
  json.extract! tutor, :id, :name, :format, :university, :price, :profile
  json.url tutor_url(tutor, format: :json)
end
