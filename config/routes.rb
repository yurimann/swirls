Rails.application.routes.draw do
  post '/add', to: 'cart#add_to_cart', as: "add"
  post '/clear', to: 'cart#clear_cart', as: "clear"
  resources :cart
  resources :users
  resources :orders
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
