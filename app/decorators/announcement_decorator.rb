module AnnouncementDecorator
  def display_date
    created_at.strftime("%Y/%m/%d")
  end
end
