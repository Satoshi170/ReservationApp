Rails.application.routes.draw do
  resources :rooms

  get 'home/index'
  get 'home/show'

  get 'users/account'
  get 'users/profile'
  get 'users/profile/edit' => 'users#edit'

  root to: "home#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
