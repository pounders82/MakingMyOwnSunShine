Rails.application.routes.draw do
  get 'password_resets/edit'

  get 'password_resets/new'

  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root("pages#home")
  get("about", to: "pages#about")
  get("contact", to: "pages#contact")
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
