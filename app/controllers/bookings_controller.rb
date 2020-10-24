class BookingsController < ApplicationController
  before_action :find_booking, only:[:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to users_dashboard_path
    else
      render 'new'
    end
  end

  private

  def find_booking
    @board = Board.find(params[:board_id])
  end

  def booking_params
    params.require(:booking).permit(:begin_date, :end_date)
  end
end
