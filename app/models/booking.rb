class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: ['open', 'approved', 'cancelled'] }
end
