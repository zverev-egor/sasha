json.array!(@welcomes) do |welcome|
  json.extract! welcome, :id, :description
  json.url welcome_url(welcome, format: :json)
end
