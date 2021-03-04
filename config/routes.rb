Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :purchases, only: [:create, :index]
    # resources :items, only: [:index, :new, :create] do
    collection do
      get 'search'
    end
  # end
  end
end
