class BoardsController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :set_board, only: [:show, :update, :destroy]

  def index
    @boards = (@user ? @user.boards : Board.all)
    if stale?(@boards)
      render json: @boards
    end
  end

  def show
    if stale?(@board)
      render json: @board
    end
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      render json: @board, status: :created, location: @board
    else
      respond_with_validation_error @board
    end
  end

  def update
    if @board.update(board_params)
      render json: @board
    else
      respond_with_validation_error @board
    end
  end

  def destroy
    @board.destroy
  end

  private
    def set_user
      @user = User.find(params[:user_id]) if params[:user_id]
    end

    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:creator_id, :title, :archived)
    end
end
