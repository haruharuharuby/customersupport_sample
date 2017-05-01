json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :term_begin, :term_end, :description
  json.url campaign_url(campaign, format: :json)
end
