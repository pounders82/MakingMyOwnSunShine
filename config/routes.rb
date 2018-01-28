Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root("pages#home")
  get("about", to: "pages#about")
  get("contact", to: "pages#contact")
  resources :articles
end
