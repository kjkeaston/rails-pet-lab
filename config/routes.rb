Rails.application.routes.draw do

  root "site#index"

  resources :owners do
    resources :pets, only: [:index, :new, :create]
  end
### the [:index, on line 6 is like writing the following
  # get "owners/:owner_id/pets", to: "pets#index", as: "owner_pets"

  resources :pets, only: :show
  # smame as ==> get "/pets/:id", to: "pets#show", as: "pet"

end
