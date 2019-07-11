class Item < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :bookings

  validates :price, presence: true
  validates :name, presence: true
  validates :category, presence: true

  include PgSearch
  pg_search_scope :search_global,
    against: [ :details, :name, :category ],
    using: {
      tsearch: { prefix: true }
    }

end
