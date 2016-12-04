Rails.application.routes.draw do
  get 'offers/index'

  get 'offers/new'

  get 'offers/create'

  get 'offers/destroy'
  resources :offers

  root to: "offers#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
