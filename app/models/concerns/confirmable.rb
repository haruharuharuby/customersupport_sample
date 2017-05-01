module Confirmable
  extend ActiveSupport::Concern

  included do
    validates :confirming, acceptance: true
    after_validation :check_confirming
  end

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end
end
