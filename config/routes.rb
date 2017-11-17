Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'subjects#index'
  get "/admin", to:'admins#index', as: :admin_dashboard
  get "/subjects/:id/courses/new", to: 'courses#new', as: :new_course
  resources :subjects
  resources :courses do
    resources :chapters do
      resources :sections
    end
  end
  resources :course_registrations

  post "/subjects/:id/courses", to: 'courses#create', as: :create_course
  patch "/courses/:id", to: 'courses#update', as: :update_course
  # get "/courses/:id/chapters/new", to: 'chapters#new', as: :new_chapter
  post "/courses/:course_id/chapters", to: 'chapters#create', as: :create_chapter
  # get "/chapters/:id/sections/new", to: 'sections#new', as: :new_section
  post "/chapters/:chapter_id/sections", to: 'sections#create', as: :create_section
  get "/search", to: 'searches#search', as: :search
  get "/search_results", to: 'searches#index', as: :search_results
end
