json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :support_begin, :support_end, :version
  json.url product_url(product, format: :json)
end
