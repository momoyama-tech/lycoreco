Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root to: 'rooms#index'
  get 'rooms' => 'rooms#index'
  post 'rooms' => 'rooms#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
