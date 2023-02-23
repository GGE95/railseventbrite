Rails.application.routes.draw do
  root 'events#index'
  # root 'static_pages#index'
  get 'static_pages/secret'
  devise_for :users
  resources :events
  resources :users, only: [:show]

  scope '/checkout' do
    post 'create' => 'checkout#create', as: 'checkout_create'
    get 'success' => 'checkout#success', as: 'checkout_success'
    get 'cancel' => 'checkout#cancel', as: 'checkout_cancel'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
