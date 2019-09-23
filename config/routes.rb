Rails.application.routes.draw do
  get 'hellos/index'
  resources :apps
  root 'hellos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
