json.array!(@services) do |service|
  json.extract! service, :id, :name, :description, :is_folder, :service_id
  json.url service_url(service, format: :json)
end
