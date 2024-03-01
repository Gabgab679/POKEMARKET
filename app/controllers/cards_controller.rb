class CardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index # Saute l'étape d'auth sur l'action index (puisque c'est notre root)

  def index
    @cards = Card.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR state ILIKE :query"
      @cards = @cards.where(sql_subquery, query: "%#{params[:query]}%")
    end
    if params[:state].present?
      substring_array = params[:state].keys.map { |e| "'#{e}'" }.join(', ')
      sql_subquery = "state IN (#{substring_array})"
      @cards = @cards.where(sql_subquery, query: "%#{params[:query]}%")
    end
    if params[:price].present?
      if params[:price].keys.first == "0 5" || params[:price].keys.first == "5 20"
        start_price = params[:price].keys.first.split.first
        end_price = params[:price].keys.first.split.second
        @cards = @cards.where("price BETWEEN :start_price AND :end_price", start_price: start_price.to_i, end_price: end_price.to_i )
      else
        @cards = @cards.where("price > 20")
      end
    end
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
