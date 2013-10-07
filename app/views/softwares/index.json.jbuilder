json.array!(@softwares) do |software|
  json.extract! software, :user_id, :name, :description
  json.url software_url(software, format: :json)
end
