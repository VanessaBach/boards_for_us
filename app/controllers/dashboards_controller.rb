class DashboardsController < ApplicationController

  def profile
    @boards = current_user.boards
  end
end
