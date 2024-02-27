class CardsController < ApplicationController
  before_action :user_signed_in?
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id
    if @card.save
      redirect_to @card, notice: 'Card was successfully created.'
    else
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.new(card_params)
  end

  def destroy
    
  end

  private

  def card_params
    params.require(:card).permit(:name, :description, :image, :state, :price)
  end
end
