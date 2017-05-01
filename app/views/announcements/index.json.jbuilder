json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :title, :content, :period_begin, :period_end
  json.url announcement_url(announcement, format: :json)
end
