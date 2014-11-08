json.array!(@tutor_profiles) do |tutor_profile|
  json.extract! tutor_profile, :id, :format
  json.url tutor_profile_url(tutor_profile, format: :json)
end
