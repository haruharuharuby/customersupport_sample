json.array!(@csps) do |csp|
  json.extract! csp, :id, :number, :nursery_id, :begin, :end, :dm_number, :password
  json.url csp_url(csp, format: :json)
end
