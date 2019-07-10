class Item < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :bookings

  validates :price, presence: true
  validates :name, presence: true
  validates :category, presence: true
end
