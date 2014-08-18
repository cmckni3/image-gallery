json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :name
  json.url gallery_url(gallery, format: :json)
end
