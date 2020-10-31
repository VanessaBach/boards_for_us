class PagesController < ApplicationController
  
  def profile
  	@boards = current_user.boards
  	@bookings = current_user.bookings
  end

end
