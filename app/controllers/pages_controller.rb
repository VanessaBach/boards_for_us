class PagesController < ApplicationController
  
  def profile
  	@boards = current_user.boards
  	@bookings = Booking.all
  end

end
