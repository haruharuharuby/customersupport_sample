json.array!(@sending_objects) do |sending_object|
  json.extract! sending_object, :id, :name, :nursery_id, :sended_at, :description
  json.url sending_object_url(sending_object, format: :json)
end
