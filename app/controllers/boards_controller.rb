class BoardsController < ApplicationController
	before_action :set_board, only: [:show, :destroy]

	def home
		@boards = GameBoard.last(10)
	end

	def index
		@boards = GameBoard.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
		@boards = @boards.search(params[:search]) if params[:search].present?
	end

	def new
		@board = GameBoard.new
	end

	def create
		@board = GameBoard.new(board_params)
		if @board.save
			minesweeper_service = MinesweeperService.new(@board.height, @board.width, @board.mines, @board)
	    @board_id = minesweeper_service.generate_board
			redirect_to board_path(@board.id)
		else
			render :new
		end
	end

	def show
		minesweeper_service = MinesweeperService.new(@board.height, @board.width, @board.mines, @board)
    @load_board = minesweeper_service.load_board(@board)
    @board_html = minesweeper_service.board_to_html(@load_board)
	end

	def destroy
		if @board.destroy
			redirect_to boards_path
		end
	end

	private

	def board_params
		params.require(:game_board).permit(:board_name, :email, :width, :height, :mines)
	end

	def set_board
		@board = GameBoard.find_by(id: params[:id])
	end
end
