class ChangeStatusInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :status, :string, default: 'open'
  end
end
