class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @items = @user.items
    @bookings_as_owner = @user.bookings_as_owner
    @own_bookings = @user.bookings
  end
end
