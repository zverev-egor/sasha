json.array!(@contacts) do |contact|
  json.extract! contact, :id, :phone_array, :whatsapp, :skype, :email, :opening_hours
  json.url contact_url(contact, format: :json)
end
