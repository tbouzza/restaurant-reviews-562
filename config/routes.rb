Rails.application.routes.draw do

  resources :restaurants do
    collection do
      get 'top'
    end

    member do
      get 'chef'
    end

    resources :reviews, only: :create
  end

  resources :reviews, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
