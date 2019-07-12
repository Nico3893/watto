class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    authorize @booking
  end

  def show
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.item_id = params[:id]
    @booking.status = "open"
    authorize @booking
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path, notice: "Your booking request was sent!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(update_params)
    authorize @booking
    redirect_to dashboard_path
  end

  def delete
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def update_params
    params.permit( :status)
  end
end
