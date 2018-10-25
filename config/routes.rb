Rails.application.routes.draw do
  get 'home/index'
  get 'home/authentication'
  devise_for :users
  resources :diaries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'diaries#index'
end
