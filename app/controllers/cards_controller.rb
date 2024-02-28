class CardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index # Saute l'étape d'auth sur l'action index (puisque c'est notre root)

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user

    if @card.save
      redirect_to @card, notice: 'Card was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @card = Card.new(card_params)
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path, notice: "Card sucessfully deleted"
  end

  private

  def card_params
    params.require(:card).permit(:name, :description, :image, :state, :price, photos: [])
  end
end
