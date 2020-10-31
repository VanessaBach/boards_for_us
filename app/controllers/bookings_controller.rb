class BookingsController < ApplicationController
  before_action :find_booking, only:[:show]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to users_dashboard_path
    else
      render 'new'
    end
    authorize @booking
  end

  def index
    @bookings = policy_scope(Booking)
  end

  def show
  end

  private

  def find_booking
    @board = Board.find(params[:board_id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:begin_date, :end_date)
  end
end
