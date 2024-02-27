class CardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index # Saute l'étape d'auth sur l'action index (puisque c'est notre root)

  def index
  end

  def show
  end

  def new
  end

  def create
  end
end
