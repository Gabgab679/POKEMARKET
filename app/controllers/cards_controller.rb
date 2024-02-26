class CardsController < ApplicationController
  before_action :user_signed_in?
  def index
    @cards = Card.all.select { |card| card.user_id = current_user.id }
  end

  def show
    @card = Card.find(params[:card_id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id
  end

  private

  def card_params
    params.require(:flat).permit(:name, :description, :image, :state, :price)
  end
end
