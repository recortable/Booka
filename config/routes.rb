Booka::Application.routes.draw do
  root :to => 'booka_lines#index'

  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :logout
  match "/identificarse" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter
  match "/invitacion/:id/:code" => "invitations#show"


  resources :booka_lines, :path => 'series'
  resources :comments, :path => 'comentar'
  resources :notifications, :path => 'actividad', :only => :index
  resources :invitations, :path => 'invitacion', :only => :create

  resources :users, :path => 'participantes' do
    get 'email_notifications', :on => :member
    resources :authentications
  end
  resources :versions, :path => 'ver', :only => [:index, :show]

  resource :system


  resources :projects, :path => '' do
    resources :contents, :path => 'materiales'
    resources :posts, :path => 'entrada'
    resources :permissions, :path => 'comunidad'
    resources :topics, :path => 'edicion'
    resources :pages, :path => 'paginas'
    resources :assets, :path => 'archivos'
  end

end
