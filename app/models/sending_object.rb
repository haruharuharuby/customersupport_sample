class SendingObject < ActiveRecord::Base
  belongs_to :nursery

  validates :name, :description, :nursery_id, :sended_at, presence:true

end
