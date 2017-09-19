Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'courses#index'
  get "/courses", to:'courses#index'
  get "/courses/1", to:'courses#show'
  get "/admin", to:'admins#index'

end
