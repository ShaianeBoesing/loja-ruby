Rails.application.routes.draw do
  resources :departamentos
  
  root to: "produtos#index"
  resources :produtos, only: [:new, :create, :destroy]
  get "produtos/search", to: "produtos#search", as: :search_produto  
end
