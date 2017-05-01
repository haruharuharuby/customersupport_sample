class Organization < ActiveRecord::Base
  has_many :nurseries
  has_many :billings

  validates :name, presence: true
end
