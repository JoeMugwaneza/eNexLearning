Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'subjects#index'
  get "/admin", to:'admins#index'
  resources :subjects
  resources :courses, except: [:new, :create]
  resources :chapters, except: [:new, :create]
  resources :sections,  except: [:new, :create]

  get "/subjects/:id/courses/new", to: 'courses#new', as: :new_course
  post "/subjects/:id/courses", to: 'courses#create', as: :create_course
  get "/courses/:id/chapters/new", to: 'chapters#new', as: :new_chapter
  post "/courses/:id/chapters", to: 'chapters#create', as: :create_chapter
  get "/chapters/:id/sections/new", to: 'sections#new', as: :new_section
  post "/chapters/:id/sections", to: 'sections#create', as: :create_section
  get "/search", to: 'searches#search', as: :search
  get "/search_results", to: 'searches#index', as: :search_results
end
