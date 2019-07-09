class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :price, presence: true
  validates :name, presence: true
  validates :category, presence: true
end
