class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    @lists = List.all
    if stale?(@lists)
      render json: @lists
    end
  end

  def show
    if stale?(@list)
      render json: @list
    end
  end

  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      respond_with_validation_error @list
    end
  end

  def update
    if @list.update(list_params)
      render json: @list
    else
      respond_with_validation_error @list
    end
  end

  def destroy
    @list.destroy
  end

  private
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:board_id, :creator_id, :title, :archived)
    end
end
