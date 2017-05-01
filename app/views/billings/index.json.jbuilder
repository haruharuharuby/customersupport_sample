json.array!(@billings) do |billing|
  json.extract! billing, :id, :name, :kana, :postal_code, :address1, :address2, :phone, :fax, :billing_type, :csp_id
  json.url billing_url(billing, format: :json)
end
