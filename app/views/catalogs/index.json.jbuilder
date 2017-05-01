json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :dm_number, :nursery_name, :postal_code, :address1, :address2, :phone, :email, :responder, :nursery_id, :product_id
  json.url catalog_url(catalog, format: :json)
end
