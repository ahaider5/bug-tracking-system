Rails.application.routes.draw do
  resources :projects, :bugs
  # resources :members
  devise_for :users

  resources :users, only: [:create, :show, :edit, :update, :destroy]

  root "pages#index"
  get "/pages", to: "pages#index"
  get "/users", to: "users#index"
  get "new_qa", to: 'projects#new_qa', :as => :new_qa
  get "new_dev", to: 'projects#new_dev', :as => :new_dev
  # get "/users/:id", to: "users#edit"
  # get "/projects", to: "projects#index"
  # get "/bugs", to: "bugs#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
