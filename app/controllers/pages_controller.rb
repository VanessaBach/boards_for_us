class PagesController < ApplicationController

  def profile
  	@boards_owners= Board.where(user_id: current_user.id)
  	@bookings = current_user.bookings
    @boards_users = current_user.boards
  end
end
