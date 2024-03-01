class PagesController < ApplicationController
  def home
  end

  def dashboard
    @cards = current_user.cards

    @cards_without_offer = @cards.select { |card| card.sale.nil? }
    @cards_with_offer_and_sold = @cards.reject { |card| card.sale.nil? }
    @cards_with_offer = @cards_with_offer_and_sold.select { |card| card.sale.status == "pending" }
    @cards_sold = @cards_with_offer_and_sold.select { |card| card.sale.status == "accepted" }

    @bought_cards = current_user.bought_cards
    @user_offer_propositions = current_user.sales

    @pending_offer_propositions = []
    @sold = []

    @bought_cards.each do |bought_card|
      @user_offer_propositions.each do |offer_proposition|
        if bought_card.id == offer_proposition.card_id
          if offer_proposition.status == "pending"
            @pending_offer_propositions << bought_card
          else
            @sold << bought_card
          end
        end
      end
    end
    # @user_offer_propositions.pluck(:card_id)
    # On veut afficher dans le dashboard deux types de cartes
      # On parcourt le tableau de bought cards pour afficher
      # Si bought cards.pluck(:card_id)
    # 1er type de cartes ou le status de la sale est en pending
        # Si user_card_id = bought_card
    # 2eme type de cartes ou l'achat est effectué
  end
end
