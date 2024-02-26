class PagesController < ApplicationController
  before_action :user_signed_in?, only: [:home]
  def home
    # on veut renvoyer vers la page url/cards
  end
end
