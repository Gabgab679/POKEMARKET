class PagesController < ApplicationController
  def home
    # on veut renvoyer vers la page url/cards
    # Commentaire d'Alex > Si on renvoie vers url/cards, on utilise redirect_to ?
  end

  def dashboard
    # @user = current_user # Supposons que vous avez une méthode current_user pour récupérer l'utilisateur actuellement connecté
    #@cards = @user.cards
    #@sales = @user.sales.includes(:card) # Assurez-vous de charger également les cartes associées aux ventes
  end
end

