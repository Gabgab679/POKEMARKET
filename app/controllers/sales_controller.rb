class SalesController < ApplicationController
  def index
  end

  def new
    @card = Card.find(params[:card_id])
  end

  def create
    @sale = Sale.new
    @sale.card = Card.find(params[:card_id])
    @sale.user = current_user
    @sale.transaction_date = Time.now
    @sale.status = "accepted"
    @sale.save
    if @sale.save
      redirect_to cards_path(@cards)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  #   @sale = Sale.find(params[:id])
  # end

  # def update
  #   @sale = Sale.find(params[:id])
  #   @sale.update(params[:card])
  # end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to cards_path(@cards), status: :see_other
  end

  private

end
