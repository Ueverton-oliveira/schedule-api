Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kinds, only: [:show]
    resource :kinds, only: [:show], path: 'relationships/kind'
    #routes phones
    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'
    
    resource :phone, only: [:update, :create, :destroy]
    resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
    #routes address
    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
