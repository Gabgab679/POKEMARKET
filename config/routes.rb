Rails.application.routes.draw do
  devise_for :users

  resources :cards do
    # En vrai, un seller serait bien dans la merde si il peut ni supprimer une carte ni l'editer alors qu'il a mal fixé le prix ou autre
    # Donc j'ai rajouté les routes edit update et destroy (peut être qu'on a même pas besoin de la route edit si la modification se fait directe dans la show)
    # comment afficher /cards différemment en fonction de la connexion d'un user?
    resources :sales, only: %i[create destroy] # edit et update a rajouter si negociation entre buyer et seller (prix)
  end

  resources :users, except: %i[index new] do # Peut être rajouter create SI DEVISE s'occupe du create, jsplus
    resources :cards # collection (la page d'un utilisateur contient les cartes possédées par cet utilisateur, donc il faut filtrer)
    resources :sales, only: %i[index show] # collection (la page d'un utilisateur contient les ventes effectuées concernant CET utilisateur, donc il faut filtrer)
  end

  # Defines the root path route ("/")
  root to: "cards#index" # = localhost 3000
end
