Web::Application.routes.draw do
  resources :products do as_routes end

  resources :book_tours do as_routes end

  resources :contacts do as_routes end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end