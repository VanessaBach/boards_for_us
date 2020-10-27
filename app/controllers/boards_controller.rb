class BoardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_board, only:[:show]

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to user_dashboard_path
    else
      render 'new'
    end
  end

  def index
    @boards = Board.all
  end

  def show
  end

  private

  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:type, :size, :year, :price_per_day)
  end
end
