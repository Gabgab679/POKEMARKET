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
      redirect_to @card, flash: { alert: 'Card was successfully created.' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to card_path(@card), success: 'Card was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
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
