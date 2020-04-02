class CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]

  def index
    @cards = Card.all
    if stale?(@cards)
      render json: @cards
    end
  end

  def show
    if stale?(@card)
      render json: @card
    end
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created, location: @card
    else
      respond_with_validation_error @card
    end
  end

  def update
    if @card.update(card_params)
      render json: @card
    else
      respond_with_validation_error @card
    end
  end

  def destroy
    @card.destroy
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:list_id, :creator_id, :assignee_id, :title, :description, :archived)
    end
end
