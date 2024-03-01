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
    @sale.status = "pending"
    if @sale.save
      redirect_to dashboard_path(params[:card_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    if Sale.find(params[:id]).update(sale_params)
      redirect_to dashboard_path, notice: 'Card was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to cards_path(@cards), status: :see_other
  end

  private

  def sale_params
    params.require(:sale).permit(:nego_price)
  end
end
