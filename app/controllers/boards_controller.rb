class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]

  def index
    @boards = Board.all

    render json: @boards
  end

  def show
    render json: @board
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      render json: @board, status: :created, location: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  def update
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:creator_id, :title, :archived)
    end
end
