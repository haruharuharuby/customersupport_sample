class Announcement < ActiveRecord::Base
  belongs_to :nursery

  scope :mine, ->(nursery) { where("nursery_id = ? or broadcast = ?", nursery.id, true).order(created_at: :desc) }
end
