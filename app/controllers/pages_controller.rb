class PagesController < ApplicationController
  def home
  end

  def dashboard
    @cards = current_user.cards

    @cards_without_offer = @cards.select { |card| card.sale.nil? }
    @cards_with_offer_and_sold = @cards.reject { |card| card.sale.nil? }
    @cards_with_offer = @cards_with_offer_and_sold.select { |card| card.sale.status == "pending" }
    @cards_sold = @cards_with_offer_and_sold.select { |card| card.sale.status == "accepted" }

    @offers = current_user.sales
    @pending_offers = @offers.reject { |offer| offer.status != "pending" }
  end
end
