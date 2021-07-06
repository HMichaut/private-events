Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :events
  resources :users
  resources :event_attendances
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "events#index"
end
