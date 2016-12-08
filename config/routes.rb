Rails.application.routes.draw do
  root to: "home#index"
    get 'home/index'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
#  resources :users
    get  '/invoices/category_select' => 'invoices#category_select'
    get  '/invoices/type_select' => 'invoices#type_select'
    get  '/invoices/name_select' => 'invoices#name_select'
  resources :invoices
    # ajax
    get  '/products/category_select' => 'products#category_select'
  resources :products
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
