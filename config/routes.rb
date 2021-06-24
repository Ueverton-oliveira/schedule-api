Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kinds, only: [:show]
    resource :kinds, only: [:show], path: 'relationships/kind'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
