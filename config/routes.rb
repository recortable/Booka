Booka::Application.routes.draw do
  root :to => 'booka_lines#index'

  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :logout
  match "/identificarse" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter

  resources :booka_lines, :path => 'series'
  resources :comments, :path => 'comentar'
  resources :notifications, :path => 'actividad', :only => :index


  resources :users, :path => 'participantes' do
  end

  scope '/admin' do
    resources :versions, :path => 'versiones'
  end

  path = Rails.env.production? ? '' : 'p'
  resources :projects, :path => path do
    resources :contents, :path => 'materiales'
    resources :posts, :path => 'entrada'
    resources :permissions, :path => 'comunidad'
    resources :topics, :path => 'edicion'
  end

end
