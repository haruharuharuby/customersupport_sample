module UuidHelper
  extend ActiveSupport::Concern

  included do
    before_create :assign_uuid
  end

  def assign_uuid
    # self.uuid = UUIDTools::UUID.timestamp_create().to_s.upcase if uuid.blank?
    self.uuid = DateTime.now.strftime('%Y%m%d%H%M%S%L')
  end
end
