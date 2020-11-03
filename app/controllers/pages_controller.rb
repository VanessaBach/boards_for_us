class PagesController < ApplicationController

  def profile
  	@boards = Board.where(user_id: current_user.id)
  	@bookings = current_user.bookings
  end
end
