Rails.application.routes.draw do
  get 'offices/show'

  get 'employees/new'

  get 'employees/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buildings, only: [:index, :show, :edit, :update]
  resources :companies, only: [:new, :create, :show]
  resources :employees, only: [:create, :destroy]
  resources :offices, only: [:show]
end
