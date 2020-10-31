class BookingsController < ApplicationController
  before_action :find_board, only: [ :new, :show, :create ]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.board = @board
    if @booking.save
      redirect_to pages_path
    else
      render 'new'
    end
    authorize @booking
  end

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
  end

  private

  def find_board
    @board = Board.find(params[:board_id])
  end

  def booking_params
    params.require(:booking).permit(:begin_date, :end_date)
  end
end
