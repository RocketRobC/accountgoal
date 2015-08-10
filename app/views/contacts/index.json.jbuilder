json.array!(@contacts) do |contact|
  json.extract! contact, :id, :title, :text
  json.url contact_url(contact, format: :json)
end
