json.array!(@records) do |record|
  json.extract! record, :id, :fio, :number, :data, :time
  json.url record_url(record, format: :json)
end
