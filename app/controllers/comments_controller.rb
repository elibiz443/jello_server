class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    @comments = Comment.all
    if stale?(@comments)
      render json: @comments
    end
  end

  def show
    if stale?(@comment)
      render json: @comment
    end
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      respond_with_validation_error @comment
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      respond_with_validation_error @comment
    end
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:card_id, :creator_id, :body)
    end
end
