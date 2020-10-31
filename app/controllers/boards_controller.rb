class BoardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_board, only:[:show]

  def new
    @board = Board.new
    authorize @board
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      redirect_to pages_path
    else
      render 'new'
    end
    authorize @board
  end

  def index
    @boards = policy_scope(Board).order(created_at: :desc)
  end

  def show
  end

  private

  def find_board
    @board = Board.find(params[:id])
    authorize @board
  end

  def board_params
    params.require(:board).permit(:style, :size, :year, :price_per_day, :photo)
  end
end
