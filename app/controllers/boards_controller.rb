class BoardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_board, only: [:show]

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
    if params[:commit].present?
      query = ""
      price_per_day = params[:price_per_day].to_i
      year = params[:year].to_i
      size = params[:size]
      style = params[:style]
      if price_per_day != 0
        query += "price_per_day <= #{price_per_day} AND "
      end
      if year != 0
        query += "year >= #{year} AND "
      end
      if size != "Select a size"
        query += "size = '#{size}' AND "
      end
      if style != "Select a style"
        query += "style = '#{style}' AND "
      end
      

      if query != ""
        query = query[0..-5]
        @boards = policy_scope(Board.paginate(page: params[:page], per_page: 8)).where(query).order(created_at: :desc)
      else
        @boards = policy_scope(Board.paginate(page: params[:page], per_page: 8)).order(created_at: :desc)
      end
    else
      @boards = policy_scope(Board.paginate(page: params[:page], per_page: 8)).order(created_at: :desc)
    end

    @markers = @boards.map do |board|
      {
        lat: board.latitude,
        lng: board.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { board: board }),
        image_url: helpers.asset_url('https://travelpedia.com.br/wp-content/uploads/2019/07/surf-icon.png')
      }
    end
  end

  def show
  end

  private

  def find_board
    @board = Board.find(params[:id])
    authorize @board
  end

  def board_params
    params.require(:board).permit(:style, :size, :year, :price_per_day, :photo, :address)
  end
end
