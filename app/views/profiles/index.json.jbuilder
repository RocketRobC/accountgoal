json.array!(@profiles) do |profile|
  json.extract! profile, :id, :fname, :lname, :city, :country, :profileimage
  json.url profile_url(profile, format: :json)
end
