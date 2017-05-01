json.array!(@estimations) do |estimation|
  json.extract! estimation, :id, :dm_number, :nursery_name, :postal_code, :address1, :address2, :phone, :email, :responder, :nursery_id, :total_sum, :coupon_code
  json.url estimation_url(estimation, format: :json)
end
