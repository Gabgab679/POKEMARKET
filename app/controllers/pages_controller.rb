class PagesController < ApplicationController
  before_action :user_signed_in?, only: [:home]
  def home
    # on veut renvoyer vers la page url/cards
    # Commentaire d'Alex > Si on renvoie vers url/cards, on utilise redirect_to ?
  end
end
