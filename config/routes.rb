Booka::Application.routes.draw do
  root :to => 'booka_lines#index'

  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :logout
  match "/identificarse" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter

  resources :booka_lines, :path => 'series'

  scope '/admin' do
    resources :versions, :path => 'versiones'
    resources :users, :path => 'participantes'
  end

  resources :projects, :path => '' do
    resources :contents, :path => 'materiales'
  end

end
