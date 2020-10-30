class PagesController < ApplicationController
  def profile
  	@boards = Board.all
  end
end
