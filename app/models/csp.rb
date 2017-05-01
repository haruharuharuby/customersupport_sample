class Csp < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         authentication_keys: [:number]

  has_one :nursery
  accepts_nested_attributes_for :nursery
  has_many :csp_billing_relations
  has_many :billings, through: :csp_billing_relations

  enum grade: { nothing:0, standard:1, premium:2 }

  scope :exclude, ->(csp) { where.not id: csp.id }

  validates :number, uniqueness:true, presence:true, format:{ with: /\AOPL-[0-9]{5}\z/}
  validates :period_begin, :period_end, presence:true, unless: :nothing?
  validates :period_begin, :period_end, absence:true, if: :nothing?
end
