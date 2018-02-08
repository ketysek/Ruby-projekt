Rails.application.routes.draw do

  resources :menus, only: [] do 
    resources :reservations, only: [:new, :create]
  end

  scope '/admin' do
    
    resources :meals do
      resources :comments
    end

    resources :menus do
      resources :reservations, only: [:index, :show, :destroy]
    end

    resources :alergens, :customers
  end

  resources :ratings

  get '/meals/:id', to: 'home#show', as: 'meal_view'
  get '/admin', to: 'admin#index'

  root 'home#index'
end
