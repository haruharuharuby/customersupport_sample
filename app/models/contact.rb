class Contact < ActiveRecord::Base
  belongs_to :nursery

  validates :name, :title, :email, :content, presence: true
end
