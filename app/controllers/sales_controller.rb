class SalesController < ApplicationController
  def index
  end

  # def new
  #   @card = Card.find(params[:card_id])
  # end

  def create
    params[:nego_price] == '' ? @sale = Sale.new(nego_price: Card.find(params[:card_id]).price) : @sale = Sale.new(nego_price: params[:nego_price])
    @sale.card = Card.find(params[:card_id])
    @sale.user = current_user
    @sale.nego_price >= Card.find(params[:card_id]).price ? @sale.status = "accepted" : @sale.status = "pending"
    if @sale.save && @sale.status == "accepted"
      redirect_to card_path(@sale.card), notice: 'You just bought a card!'
    elsif @sale.save && @sale.status == "pending"
      redirect_to card_path(@sale.card), notice: 'Your offer was sent!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @card = Card.find(params[:id])
    @sale = @card.sale
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.nego_price > params[:sale][:nego_price].to_f
      render :edit
    else
      @sale.card.price <= params[:sale][:nego_price].to_f ? @sale.status = "accepted" : @sale.status = "pending"
      @sale.user = current_user
      if @sale.status == "accepted"
        redirect_to dashboard_path, notice: 'Congrats! You just bought a card!'
      elsif @sale.update(sale_params) && @sale.status == "pending"
        redirect_to card_path(@sale.card), notice: 'Your offer was sent!'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def deal
    @sale = Sale.find(params[:id])
    @sale.status = "Accepted"
    redirect_to dashboard_path, notice: 'Congrats! You just sold your card!'
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def sale_params
    params.require(:sale).permit(:nego_price)
  end
end
